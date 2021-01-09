using Model.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopFruit.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Detail(int id)
        {
            var product = new ProductDAO().ProductDetail(id);
            
            ViewBag.Category = new CategoryProductDAO().ViewDetail(product.DanhMucSanPhamID.Value);
            ViewBag.SanPhamMois = new ProductDAO().ListNewProduct(5);
            ViewBag.SanPhamMois1 = new ProductDAO().ListNewProduct1(5);
            ViewBag.RelatedProducts = new ProductDAO().ListNewProduct(id);
            ViewBag.AnhSanPhams = new ProductDAO().ListImage(id);
            return View(product);
        }
        [ChildActionOnly]
        public PartialViewResult SanPhamMois(int id)
        {
            ViewBag.SanPhamMois = new ProductDAO().ListNewProduct(5);
            return PartialView();
        }
        [ChildActionOnly]
        public PartialViewResult SanPhamMois1(int id)
        {
            ViewBag.SanPhamMois1 = new ProductDAO().ListNewProduct1(5);
            return PartialView();
        }
    }
}