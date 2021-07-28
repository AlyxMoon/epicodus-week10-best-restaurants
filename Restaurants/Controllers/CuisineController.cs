using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Restaurants.Models;

namespace Restaurants.Controllers
{
  [Route("/cuisines")]
  public class CuisineController : Controller
  {
    private readonly DatabaseContext _db;

    public CuisineController(DatabaseContext db)
    {
      _db = db;
    }

    [HttpGet]
    public ActionResult Index ()
    {
      return View(_db.Cuisines.ToList());
    }

    [HttpPost]
    public ActionResult Create (Cuisine item)
    {
      _db.Cuisines.Add(item);
      _db.SaveChanges();

      return RedirectToAction("Index");
    }

    [HttpGet("{cuisineId}/delete")]
    public ActionResult Delete (int cuisineId)
    {
      Cuisine item = _db.Cuisines.FirstOrDefault(item => item.Id == cuisineId);
      _db.Cuisines.Remove(item);
      _db.SaveChanges();

      return RedirectToAction("Index");
    }
  }
}