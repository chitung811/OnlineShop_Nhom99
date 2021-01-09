using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopFruit.Common;

namespace ShopFruit.Areas.Admin.Controllers
{
    public class UserController : BaseController
    {

        UserDb userDb = new UserDb();
        // GET: Home  
        public ActionResult Index()
        {
            return View(GetAllEmployee());
        }

        public IEnumerable<User> GetAllEmployee()
        {
            using (FruitShopDbContext db = new FruitShopDbContext())
            {
                return db.Users.ToList<User>();
            }

        }
        public PartialViewResult FormUser()
        {
            return PartialView();
        }
        public JsonResult List()
        {
            return Json(userDb.ListAll(), JsonRequestBehavior.AllowGet);
        }
        public JsonResult Add(User ID)
        {
            ID.Password = Encryptor.MD5Hash(ID.Password);
            return Json(userDb.Add(ID), JsonRequestBehavior.AllowGet);
        }
        
        public JsonResult GetbyID(long ID)
        {
            var user = userDb.ListAll().Find(x => x.UserID.Equals(ID));
            return Json(user, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Update(User ID)
        {
            return Json(userDb.Update(ID), JsonRequestBehavior.AllowGet);
        }
        public JsonResult Delete(long ID)
        {
            return Json(userDb.Delete(ID), JsonRequestBehavior.AllowGet);
        }
    }
}