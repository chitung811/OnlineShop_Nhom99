using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopFruit.Areas.Admin.Controllers
{
    public class OrderController : Controller
    {
        // GET: Admin/Order
        OrderDAO orderDAO = new OrderDAO();
        public ActionResult Index()
        {
            return View(GetAllEmployee());
        }

        public IEnumerable<Order> GetAllEmployee()
        {
            using (FruitShopDbContext db = new FruitShopDbContext())
            {
                return db.Orders.ToList<Order>();
            }

        }
        public JsonResult List()
        {
            using (FruitShopDbContext db = new FruitShopDbContext())
            {
                return Json(db.Orders.ToList<Order>(), JsonRequestBehavior.AllowGet);
            }
            //return Json(SanPhamDAO.ListAll(), JsonRequestBehavior.AllowGet);
        }
   

        public JsonResult GetbyID(long ID)
        {
            var order = orderDAO.ListAll().Find(x => x.OrderID == ID); ;
            return Json(order, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Update(Order ID)
        {
            ID.CreateDate = DateTime.Now;
            ID.UserID = 0;
            return Json(orderDAO.Update(ID), JsonRequestBehavior.AllowGet);
        }
        public JsonResult Delete(long ID)
        {
            return Json(orderDAO.Delete(ID), JsonRequestBehavior.AllowGet);
        }
        public PartialViewResult FormOrder()
        {

            return PartialView();
        }
    }
}