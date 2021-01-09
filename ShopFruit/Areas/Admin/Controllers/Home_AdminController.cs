using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopFruit.Areas.Admin.Controllers
{
    public class Home_AdminController : BaseController
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            SanPhamDAO sanPhamDAO = new SanPhamDAO();
            var sanPhamConLai = sanPhamDAO.LaySoLuongConLai(5);
            return View();
        }
        public PartialViewResult SanPhamConLai()
        {
            SanPhamDAO sanPhamDAO = new SanPhamDAO();
            ViewBag.sanPhamConLai = sanPhamDAO.LaySoLuongConLai(5);
            return PartialView();
        }
        public PartialViewResult SoLuongDonHang()
        {
            OrderDAO orderDAO = new OrderDAO();
            ViewBag.SoLuongDonHang = orderDAO.SoLuongDonHang();
            return PartialView();
        }
        public PartialViewResult SoLuongBlog()
        {
            BlogDAO blogDAO = new BlogDAO();
            ViewBag.SoLuongBlog = blogDAO.SoLuongBlog();
            return PartialView();
        }
        public PartialViewResult TongTien()
        {
            OrderDAO orderDAO = new OrderDAO();
            ViewBag.TongTien = orderDAO.TongTien();
            return PartialView();
        }
        public PartialViewResult DonHangDaGiao()
        {
            OrderDAO orderDAO = new OrderDAO();
            ViewBag.DonHangDaGiao = orderDAO.DonHangDaGiao();
            return PartialView();
        }
        public ActionResult Logout()
        {
            Session[Common.CommonConstants.USER_SESSION] = null;
            return RedirectToAction("Index","Home",new { area=""});
        }

    }
}