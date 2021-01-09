using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopFruit.Areas.Admin.Controllers
{
    public class BlogController : Controller
    {
        // GET: Admin/Blog
        BlogDAO BlogDAO= new BlogDAO();
        // GET: Admin/Contact
        public ActionResult Index()
        {
            return View(GetAllEmployee());
        }

        public IEnumerable<Blog> GetAllEmployee()
        {
            using (FruitShopDbContext db = new FruitShopDbContext())
            {
                return db.Blogs.ToList<Blog>();
            }

        }
        public PartialViewResult FormBlog()
        {
            return PartialView();
        }
        public JsonResult List()
        {
            return Json(BlogDAO.ListAll(), JsonRequestBehavior.AllowGet);
        }
        public JsonResult Add(Blog ID)
        {
            ID.CreateDate = DateTime.Now;
            return Json(BlogDAO.Add(ID), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetbyID(int ID)
        {
            var user = BlogDAO.List().Find(x => x.BlogID.Equals(ID));
            return Json(user, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Update(Blog ID)
        {
            ID.CreateDate = DateTime.Now;
            return Json(BlogDAO.Update(ID), JsonRequestBehavior.AllowGet);
        }
        public JsonResult Delete(int ID)
        {
            return Json(BlogDAO.Delete(ID), JsonRequestBehavior.AllowGet);
        }
    }
}