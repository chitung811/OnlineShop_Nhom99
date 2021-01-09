using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopFruit.Areas.Admin.Controllers
{
    public class ContactController : BaseController
    {
        ContactDAO ContactDAO = new ContactDAO();
        // GET: Admin/Contact
        public ActionResult Index()
        {
            return View(GetAllEmployee());
        }

        public IEnumerable<Contact> GetAllEmployee()
        {
            using (FruitShopDbContext db = new FruitShopDbContext())
            {
                return db.Contacts.ToList<Contact>();
            }

        }
        public PartialViewResult FormContact()
        {
            return PartialView();
        }
        public JsonResult List()
        {
            return Json(ContactDAO.ListAll(), JsonRequestBehavior.AllowGet);
        }
        public JsonResult Add(Contact ID)
        {
            return Json(ContactDAO.Add(ID), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetbyID(int ID)
        {
            var user = ContactDAO.ListAll().Find(x => x.ContactID.Equals(ID));
            return Json(user, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Update(Contact ID)
        {
            return Json(ContactDAO.Update(ID), JsonRequestBehavior.AllowGet);
        }
        public JsonResult Delete(int ID)
        {
            return Json(ContactDAO.Delete(ID), JsonRequestBehavior.AllowGet);
        }
    }
}