using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Restaurants.Models
{
  public class Cuisine
  {
    public int Id { get; set; }

    [Required()]
    [DisplayName("Cuisine Name")]
    public string Name { get; set; }

    [DataType(DataType.MultilineText)]
    [DisplayName("Description")]
    public string Description { get; set; }

    public virtual ICollection<Restaurant> Restaurants { get; set; }

    public Cuisine ()
    {
      this.Restaurants = new HashSet<Restaurant>();
    }
  }
}