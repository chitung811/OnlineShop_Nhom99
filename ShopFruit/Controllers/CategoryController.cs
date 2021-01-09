using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopFruit.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Category
        public ActionResult CategoryProduct(long id)
        {
            var categoryProduct = new CategoryProductDAO().ViewDetail(id);
            ViewBag.CategoryProduct = categoryProduct;
            var model = new ProductDAO().ListProductByCategory(id).Take(10);
            return View(model);
        }

        public PartialViewResult Category()
        {
            ViewBag.DanhMuc = new CategoryProductDAO().ListCategoryProduct();
            var model = new CategoryDAO().ListAllCatogory();
            return PartialView(model);
        }
        public JsonResult SortProduct(long? id, string sort = null)
        {
            var model = new ProductDAO().ListProductByCategory(id);
            switch (sort)
            {
                case "1":
                    {
                        model.OrderBy(x => x.SanPhamID);
                        break;
                    }
                case "2":
                    {
                        model.OrderBy(x => x.PromotionPrice);
                        break;
                    }
                case "3":
                    {
                        model.OrderBy(x => x.TenSanPham);
                        break;
                    }
            }
            
            return Json(model);
        }
        [HttpPost]
        [AllowAnonymous]
        public JsonResult LoadMoreProduct(long? id, int size)
        {
            ViewBag.Count = size;
            var model = new ProductDAO().ListProductByCategory(id).Skip(size).Take(10);
            int modelCount = new ProductDAO().ListProductByCategory(id).Count();
            ViewBag.CountAll = modelCount;
            if (model.Any())
            {
                string modelString = RenderRazorViewToString("_LoadMoreProduct", model);
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
    }
}