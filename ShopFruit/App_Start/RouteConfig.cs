﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace ShopFruit
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
              name: "Search",
              url: "tim-kiem",
              defaults: new { controller = "Search", action = "Search", id = UrlParameter.Optional },
              namespaces: new[] { "ShopFruit.Controllers" }
              );
            routes.MapRoute(
             name: "product detail",
             url: "chi-tiet-{metatitle}-{id}",
             defaults: new { controller = "Product", action = "Detail", id = UrlParameter.Optional },
             namespaces: new[] { "ShopFruit.Controllers" }
         );
            routes.MapRoute(
            name: "Danh muc",
            url: "Danh-muc/{id}",
            defaults: new { controller = "Category", action = "CategoryProduct", id = UrlParameter.Optional },
            namespaces: new[] { "ShopFruit.Controllers" }
        );



            //    routes.MapRoute(
            //     name: "Payment",
            //     url: "thanh-toan",
            //     defaults: new { controller = "Cart", action = "Payment", id = UrlParameter.Optional },
            //     namespaces: new[] { "ShopFruit.Controllers" }
            //);
            routes.MapRoute(
             name: "Add cart",
             url: "them-gio-hang",
             defaults: new { controller = "Cart", action = "AddItem", id = UrlParameter.Optional },
             namespaces: new[] { "ShopFruit.Controllers" }
         );
            routes.MapRoute(
               name: "Default",
               url: "{controller}/{action}/{id}",
               defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "ShopFruit.Controllers" }
           );
        
            //routes.MapRoute(
            // name: "blog",
            // url: "blog",
            // defaults: new { controller = "Blog", action = "Index", id = UrlParameter.Optional },
            // namespaces: new[] { "ShopFruit.Controllers" }
            // );
            //routes.MapRoute(
            // name: "chi tiet blog",
            // url: "chi-tiet-blog/{id}",
            // defaults: new { controller = "Blog", action = "Detail", id = UrlParameter.Optional },
            // namespaces: new[] { "ShopFruit.Controllers" }
            // );
            //routes.MapRoute(
            //   name: "Payment Success",
            //   url: "hoan-thanh",
            //   defaults: new { controller = "Cart", action = "Success", id = UrlParameter.Optional },
            //   namespaces: new[] { "ShopFruit.Controllers" }

         //);
        //    routes.MapRoute(
        //      name: "quan ly don hang",
        //      url: "quan-ly-don-hang",
        //      defaults: new { controller = "User", action = "QuanLyDonHang", id = UrlParameter.Optional },
        //      namespaces: new[] { "ShopFruit.Controllers" }

        //);
        //    routes.MapRoute(
        //     name: "Payment Error",
        //     url: "bao-tri",
        //     defaults: new { controller = "Cart", action = "Error", id = UrlParameter.Optional },
        //     namespaces: new[] { "ShopFruit.Controllers" }

        //     );

           
        }
    }
}
