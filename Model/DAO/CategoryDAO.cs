using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class CategoryDAO
    {
        FruitShopDbContext db = null;
        public CategoryDAO()
        {
            db = new FruitShopDbContext();
        }

        public List<DanhMuc> ListAllCatogory()
        {
            return db.DanhMucs.Where(x => x.Status == 1).OrderBy(x => x.TenDanhMuc).ToList();
        }
       
        public DanhMuc ViewDetail(long id)
        {
            return db.DanhMucs.Find(id);
        }
    }
}
