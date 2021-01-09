using Model.EF;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopFruit.Controllers
{
    public class SearchController : Controller
    {
        // GET: Search
        public ActionResult Search(string term)
        {
            FruitShopDbContext db = new FruitShopDbContext();
            var list = db.SanPhams.Where(x => x.Status == 1 && x.TenSanPham.Contains(term)).ToList().Take(10);
            return View(list);
            
        }
        [HttpPost]
        [AllowAnonymous]
        public JsonResult LoadMoreProduct(string term, int size)
        {
            FruitShopDbContext db = new FruitShopDbContext();
            var model = db.SanPhams.Where(x => x.Status == 1 && x.TenSanPham.Contains(term)).ToList().Skip(size).Take(10);
            int modelCount = db.SanPhams.Where(x => x.Status == 1 && x.TenSanPham.Contains(term)).ToList().Count();
            if (model.Any())
            {
                string modelString = RenderRazorViewToString("_SearchLoadMoreProduct", model);
                return Json(new { ModelString = modelString, ModelCount = modelCount });
            }
            return Json(model);
        }

        public string RenderRazorViewToString(string viewName, object model)
        {
            ViewData.Model = model;
            using (var sw = new StringWriter())
            {
                var viewResult = ViewEngines.Engines.FindPartialView(ControllerContext, viewName);
                var viewContext = new ViewContext(ControllerContext, viewResult.View,
                                                    ViewData, TempData, sw);
                viewResult.View.Render(viewContext, sw);
                viewResult.ViewEngine.ReleaseView(ControllerContext, viewResult.View);
                return sw.GetStringBuilder().ToString();
            }
        }
        public JsonResult GetSearchValue(string term)
        {
            Response.CacheControl = "no-cache";
            FruitShopDbContext DB = new FruitShopDbContext();
            var usrScreenNamelst = DB.SanPhams.Where(a => a.TenSanPham.Contains(term)).ToList();
            string userProfileImagePath = "~/Content/Client/images/";
            var lst = usrScreenNamelst.Select(m => new
            {
                SanPhamID = m.SanPhamID,
                TenSanPham = m.TenSanPham,
                DonGia = m.DonGia,
                MetaKeyword = m.MetaKeyword,
                image = Url.Content(userProfileImagePath + (string.IsNullOrEmpty(m.Image) ?
                 "NoProfileImage.png" : m.Image))
            }).ToList().Take(5);
            return Json(lst.ToArray(), JsonRequestBehavior.AllowGet);
        }
     
    }
}