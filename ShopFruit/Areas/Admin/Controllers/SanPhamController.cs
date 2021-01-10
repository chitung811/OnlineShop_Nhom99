using Microsoft.AspNetCore.Http;
using Model.DAO;
using Model.EF;
using Model.ViewModel;
using PagedList;
using ShopFruit.Areas.Admin.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace ShopFruit.Areas.Admin.Controllers
{
    public class SanPhamController : BaseController
    {
        // GET: Admin/SanPham
        SanPhamDAO SanPhamDAO = new SanPhamDAO();
        public ActionResult Index()
        {
            return View(GetAllEmployee());
        }

       public IEnumerable<SanPham> GetAllEmployee()
        {
            using (FruitShopDbContext db = new FruitShopDbContext())
            {
                return db.SanPhams.ToList<SanPham>();
            }

        }
        public JsonResult List()
        {
            using (FruitShopDbContext db = new FruitShopDbContext())
            {
                return Json(db.SanPhams.ToList<SanPham>(), JsonRequestBehavior.AllowGet);
            }
            //return Json(SanPhamDAO.ListAll(), JsonRequestBehavior.AllowGet);
        }
        public JsonResult Add(SanPham ID)
        {
            //if (ModelState.IsValid)
            //{
            //    if(Hinh != null)
            //    {
            //        var urlFull = Path.Combine(Directory.GetCurrentDirectory(), "ShopFruit", "Content", "Client", "images", Hinh.FileName);
            //        using(var file = new FileStream(urlFull, FileMode.Create))
            //        {
            //            await Hinh.CopyToAsync(file);
            //        }
            //        ID.Image = Hinh.FileName;
            //    }
            //}
            SetViewBag();
            return Json(SanPhamDAO.Add(ID), JsonRequestBehavior.AllowGet);
        }
        public void SetViewBag()
        {
            DanhMucSanPhamDAO dao = new DanhMucSanPhamDAO();
            ViewBag.CategoryID = new SelectList(dao.ListAll(), "DanhMucSanPhamID", "TenDanhMucSanPham");
        }
        public JsonResult GetbyID(long ID)
        {
            var user = SanPhamDAO.ListAll().Find(x => x.SanPhamID.Equals(ID));
            return Json(user, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Update(SanPham ID)
        {
            SetViewBag();
            return Json(SanPhamDAO.Update(ID), JsonRequestBehavior.AllowGet);
        }
        public JsonResult Delete(long ID)
        {
            return Json(SanPhamDAO.Delete(ID), JsonRequestBehavior.AllowGet);
        }
        public PartialViewResult FormSanPham()
        {
            SetViewBag();
            return PartialView();
        }
    }
}