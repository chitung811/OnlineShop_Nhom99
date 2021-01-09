using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopFruit.Controllers
{
    public class BlogController : Controller
    {
        // GET: Blog
        BlogDAO blogDAO = new BlogDAO();

        public ActionResult Index()
        {
            var model = blogDAO.ListAll();
            return View(model);
        }
        public ActionResult Detail( int ID)
        {
            var model = blogDAO.BlogDetail(ID);
            return View(model);
        }
        public JsonResult List()
        {
            return Json(blogDAO.ListAll(), JsonRequestBehavior.AllowGet);
        }
        public JsonResult LoadData(int page, int pageSize = 10)
        {
            var model = blogDAO.ListAll().Skip((page - 1) * pageSize).Take(pageSize);
            int totalRow = blogDAO.ListAll().Count();
            return Json(new
            {
                data = model,
                total = totalRow,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }
    }
}