using Model.EF;
using System.Collections.Generic;
using System.Linq;

namespace ShopFruit.Controllers
{
    public class SlideDAO
    {
        FruitShopDbContext db = null;
        public SlideDAO()
        {
            db = new FruitShopDbContext();
        }

        public List<Slide> ListAll()
        {
            return db.Slides.Where(x => x.Status == true).OrderBy(y => y.SlideID).ToList();
        }
    }
}