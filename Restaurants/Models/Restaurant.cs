using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Restaurants.Models
{
  public class Restaurant
  {
    public int Id { get; set; }

    [Required()]
    [DisplayName("Cuisine")]
    [ForeignKey("Cuisine")]
    public int Id_Cuisine { get; set; }

    [Required()]
    public string Name { get; set; }

    [Required()]
    public string Description { get; set; }
    public int Price { get; set; }

    public virtual Cuisine Cuisine { get; set; }
  }
}