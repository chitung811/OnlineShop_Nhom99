using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopFruit.Areas.Admin.Controllers
{
    public class DanhMucController : BaseController
    {
        DanhMucDAO DanhMucDAO = new DanhMucDAO();
        // GET: Admin/DanhMuc
        public ActionResult Index()
        {
            return View(GetAllEmployee());
        }

        public IEnumerable<DanhMuc> GetAllEmployee()
        {
            using (FruitShopDbContext db = new FruitShopDbContext())
            {
                return db.DanhMucs.ToList<DanhMuc>();
            }

        }
        public PartialViewResult FormDanhMuc()
        {
            return PartialView();
        }
        public JsonResult List()
        {
            return Json(DanhMucDAO.ListAll(), JsonRequestBehavior.AllowGet);
        }
        public JsonResult Add(DanhMuc ID)
        {
            return Json(DanhMucDAO.Add(ID), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetbyID(int ID)
        {
            var danhMuc = DanhMucDAO.ListAll().Find(x => x.DanhMucID.Equals(ID));
            return Json(danhMuc, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Update(DanhMuc ID)
        {
            return Json(DanhMucDAO.Update(ID), JsonRequestBehavior.AllowGet);
        }
        public JsonResult Delete(int ID)
        {
            return Json(DanhMucDAO.Delete(ID), JsonRequestBehavior.AllowGet);
        }
    }
}