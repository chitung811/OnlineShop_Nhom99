using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopFruit.Areas.Admin.Controllers
{
    public class DanhMucSanPhamController : BaseController
    {
        DanhMucSanPhamDAO DanhMucSanPhamDAO = new DanhMucSanPhamDAO();
        // GET: Admin/DanhMucSanPham
        public ActionResult Index()
        {
            SetViewBag();
            return View(GetAllEmployee());
        }

        public IEnumerable<DanhMucSanPham> GetAllEmployee()
        {
            using (FruitShopDbContext db = new FruitShopDbContext())
            {
                return db.DanhMucSanPhams.ToList<DanhMucSanPham>();
            }

        }
        public PartialViewResult FormDanhMucSanPham()
        {
            SetViewBag();
            return PartialView();
        }
        public void SetViewBag()
        {
            DanhMucDAO dao = new DanhMucDAO();
            ViewBag.CategoryID = new SelectList(dao.ListAll(), "DanhMucID", "TenDanhMuc");
        }
        public JsonResult List()
        {
            return Json(DanhMucSanPhamDAO.ListAll(), JsonRequestBehavior.AllowGet);
        }
        public JsonResult Add(DanhMucSanPham ID)
        {
            SetViewBag();
            return Json(DanhMucSanPhamDAO.Add(ID), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetbyID(int ID)
        {
            var user = DanhMucSanPhamDAO.ListAll().Find(x => x.DanhMucSanPhamID.Equals(ID));
            return Json(user, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Update(DanhMucSanPham ID)
        {
            SetViewBag();
            return Json(DanhMucSanPhamDAO.Update(ID), JsonRequestBehavior.AllowGet);
        }
        public JsonResult Delete(int ID)
        {
            return Json(DanhMucSanPhamDAO.Delete(ID), JsonRequestBehavior.AllowGet);
        }
    }
}