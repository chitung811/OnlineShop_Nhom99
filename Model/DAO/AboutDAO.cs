using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class AboutDAO
    {
        FruitShopDbContext db = null;
        public AboutDAO()
        {
            db = new FruitShopDbContext();
        }
        public List<About> GetAbout()
        {
            return db.Abouts.ToList();
        }
    }
}
