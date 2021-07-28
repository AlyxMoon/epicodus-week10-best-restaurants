using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Restaurants.Models;

namespace Restaurants.Controllers
{
  [Route("/restaurants")]
  public class RestaurantController : Controller
  {
    private readonly DatabaseContext _db;

    public RestaurantController(DatabaseContext db)
    {
      _db = db;
    }

    [HttpGet]
    public ActionResult Index ()
    {
      ViewBag.Cuisines = new SelectList(_db.Cuisines, "Id", "Name");
      
      List<Restaurant> Restaurants = _db.Restaurants
        .Include(item => item.Cuisine)
        .ToList();

      return View(Restaurants);
    }

    [HttpPost]
    public ActionResult Create (Restaurant item)
    {
      _db.Restaurants.Add(item);
      _db.SaveChanges();

      return RedirectToAction("Index");
    }

    [HttpGet("{restaurantId}/delete")]
    public ActionResult Delete (int restaurantId)
    {
      Restaurant item = _db.Restaurants.FirstOrDefault(item => item.Id == restaurantId);
      _db.Restaurants.Remove(item);
      _db.SaveChanges();

      return RedirectToAction("Index");
    }
  }
}