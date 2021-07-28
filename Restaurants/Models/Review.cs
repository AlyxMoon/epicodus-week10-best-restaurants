
namespace Restaurants.Models
{
  public class Review
  {
    public int Id { get; set; }
    public int IdCuisine { get; set; }
    public string Username { get; set; }
    public string Description { get; set; }
    public int Stars { get; set; }
  }
}