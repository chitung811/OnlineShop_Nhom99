using Model.EF;
using ShopFruit.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopFruit.Areas.Admin.Controllers
{
    public class SlideController : BaseController
    {
        SlideDb SlideDb = new SlideDb();
        // GET: Admin/Slide
        public ActionResult Index()
        {
            return View(GetAllEmployee());
        }

        public IEnumerable<Slide> GetAllEmployee()
        {
            using (FruitShopDbContext db = new FruitShopDbContext())
            {
                return db.Slides.ToList<Slide>();
            }

        }
        public PartialViewResult FormSlide()
        {
            return PartialView();
        }
        public JsonResult List()
        {
            return Json(SlideDb.ListAll(), JsonRequestBehavior.AllowGet);
        }
        public JsonResult Add(Slide ID)
        {
            
            return Json(SlideDb.Add(ID), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetbyID(int ID)
        {
            var user = SlideDb.ListAll().Find(x => x.SlideID.Equals(ID));
            return Json(user, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Update(Slide ID)
        {
            return Json(SlideDb.Update(ID), JsonRequestBehavior.AllowGet);
        }
        public JsonResult Delete(int ID)
        {
            return Json(SlideDb.Delete(ID), JsonRequestBehavior.AllowGet);
        }
    }
}