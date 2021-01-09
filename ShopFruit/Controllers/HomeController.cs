using Model.DAO;
using Model.EF;
using ShopFruit.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopFruit.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Slides = new SlideDAO().ListAll();
            var productDAO = new ProductDAO();
            var DanhMucDAO = new DanhMucDAO();
            var DanhMucSanPhamDAO = new CategoryProductDAO();
            ViewBag.NewProducts = productDAO.ListNewProduct(4);
            ViewBag.NewProducts1 = productDAO.ListNewProduct1(4);
            ViewBag.ListFeatureProducts = productDAO.ListFeatureProduct(4);
            ViewBag.SanPhamBanChay = productDAO.SanPhamBanChay(4);
            ViewBag.DanhMuc = DanhMucDAO.ListAll();
            ViewBag.DanhMucSanPham = DanhMucSanPhamDAO.ListCategoryProduct();
            return View();
        }
        
        public PartialViewResult HeaderCart()
        {
            var cart = Session[Common.CommonConstants.CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            return PartialView(list);
        }
        public ActionResult Footer()
        {
            var model = new FooterDAO().GetFooter();
            return PartialView(model);
        }
        public ActionResult About()
        {
            return View("About");
        }
        [HttpGet]
        public ActionResult Contact()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Contact(MessageContact messageContact)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDAO();
                long id = dao.InsertMessage(messageContact);
                if (id > 0)
                {
                    ModelState.AddModelError("", "Gửi thành công");
                    return RedirectToAction("Contact", "Home");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm user không thành công");
                }
            }
            return View();
        }
    }
}