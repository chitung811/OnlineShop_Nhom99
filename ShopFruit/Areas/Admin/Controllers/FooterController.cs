using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopFruit.Areas.Admin.Controllers
{
    public class FooterController : BaseController
    {
        FooterDb FooterDb = new FooterDb();
        // GET: Admin/Footer
        public ActionResult Index()
        {
            return View(GetAllEmployee());
        }

        public IEnumerable<Footer> GetAllEmployee()
        {
            using (FruitShopDbContext db = new FruitShopDbContext())
            {
                return db.Footers.ToList<Footer>();
            }

        }
        public PartialViewResult FormFooter()
        {
            return PartialView();
        }
        public JsonResult List()
        {
            return Json(FooterDb.ListAll(), JsonRequestBehavior.AllowGet);
        }
        public JsonResult Add(Footer ID)
        {
            return Json(FooterDb.Add(ID), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetbyID(int ID)
        {
            var user = FooterDb.ListAll().Find(x => x.FooterID.Equals(ID));
            return Json(user, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Update(Footer ID)
        {
            return Json(FooterDb.Update(ID), JsonRequestBehavior.AllowGet);
        }
        public JsonResult Delete(int ID)
        {
            return Json(FooterDb.Delete(ID), JsonRequestBehavior.AllowGet);
        }
    }
}