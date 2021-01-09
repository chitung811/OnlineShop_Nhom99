using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class CategoryProductDAO
    {
        FruitShopDbContext db = null;
        public CategoryProductDAO()
        {
            db = new FruitShopDbContext();
        }
        public List<DanhMucSanPham> ListCategoryProduct()
        {
            
            return db.DanhMucSanPhams.ToList();
        }
        public DanhMucSanPham ViewDetail(long id)
        {
            return db.DanhMucSanPhams.Find(id);
        }
    }
}
