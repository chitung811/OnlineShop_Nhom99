using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class ProductDAO
    {
        FruitShopDbContext db = null;
        public ProductDAO()
        {
            db = new FruitShopDbContext();
        }

        public List<SanPham> ListNewProduct(int top)
        {
            return db.SanPhams.OrderBy(x => x.Quantity).Take(top).ToList();
        }
        public List<SanPham> ListNewProduct1(int top)
        {
            return db.SanPhams.OrderByDescending(x => x.TenSanPham).Take(top).ToList();
        }
        public List<SanPham> ListFeatureProduct(int top)
        {
            return db.SanPhams.OrderBy(x => x.PromotionPrice).Take(top).ToList();
        }
        public List<SanPham> SanPhamBanChay(int top)
        {
            return db.SanPhams.Where(x => x.Status == 1).OrderBy(x=> x.DonGia).Take(top).ToList();
        }
        public List<SanPham> ListRelatedProduct(long productID)
        {
            var product = db.SanPhams.Find(productID);
            return db.SanPhams.Where(x =>x.SanPhamID !=productID && x.DanhMucSanPhamID ==product.DanhMucSanPhamID).ToList();
        }
        
        public SanPham ProductDetail(long id)
        {
            return db.SanPhams.Find(id);
        }
        public List<AnhSanPham> ListImage(long productID)
        {
            var product = db.SanPhams.Find(productID);
            return db.AnhSanPhams.Where(x => x.SanPhamID == product.SanPhamID).ToList();
        }
        public List<SanPham> ListProductByCategory(long? id)
        {
            return db.SanPhams.Where(x => x.DanhMucSanPhamID == id).ToList();
        }
    }
}
