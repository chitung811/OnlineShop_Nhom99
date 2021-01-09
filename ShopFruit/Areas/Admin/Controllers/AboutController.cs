using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopFruit.Areas.Admin.Controllers
{
    public class AboutController : BaseController
    {
        AboutDb AboutDb = new AboutDb();
        // GET: Admin/About
        public ActionResult Index()
        {
            return View(GetAllEmployee());
        }

        public IEnumerable<About> GetAllEmployee()
        {
            using (FruitShopDbContext db = new FruitShopDbContext())
            {
                return db.Abouts.ToList<About>();
            }

        }
        public PartialViewResult FormAbout()
        {
            return PartialView();
        }
        public JsonResult List()
        {
            return Json(AboutDb.ListAll(), JsonRequestBehavior.AllowGet);
        }
        public JsonResult Add(About ID)
        {
            return Json(AboutDb.Add(ID), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetbyID(int ID)
        {
            var about = AboutDb.ListAll().Find(x => x.AboutID.Equals(ID));
            return Json(about, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Update(About ID)
        {
            return Json(AboutDb.Update(ID), JsonRequestBehavior.AllowGet);
        }
        public JsonResult Delete(int ID)
        {
            return Json(AboutDb.Delete(ID), JsonRequestBehavior.AllowGet);
        }
    }
}