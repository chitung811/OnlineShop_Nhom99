using Common;
using Model.DAO;
using Model.EF;
using ShopFruit.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace ShopFruit.Controllers
{
    public class CartController : Controller
    {
        private const string CartSession = "CartSession";
        // GET: Cart
        public ActionResult Index()
        {
            FruitShopDbContext db = new FruitShopDbContext();
            ViewBag.Ship = db.Ships.ToList();
            var cart = Session[CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
                
            }
            return View(list);
        }
        public JsonResult DeleteAll()
        {
            Session[CartSession] = null;
            return Json(new
            {
                
                status = true
            });
        }
        public JsonResult Delete(long id)
        {
            var sessionCart = (List<CartItem>)Session[CartSession];
            sessionCart.RemoveAll(x => x.Product.SanPhamID == id);
            Session[CartSession] = sessionCart;
            return Json(new
            {
                status = true
            });
        }
        public JsonResult Update(string cartModel)
        {
            var jsonCart = new JavaScriptSerializer().Deserialize<List<CartItem>>(cartModel);
            var sessionCart = (List<CartItem>)Session[CartSession];

            foreach (var item in sessionCart)
            {
                var jsonItem = jsonCart.SingleOrDefault(x => x.Product.SanPhamID == item.Product.SanPhamID);
                if (jsonItem != null)
                {
                    item.Quantity = jsonItem.Quantity;
                }
            }
            Session[CartSession] = sessionCart;
            return Json(new
            {
                status = true
            });
        }
        public ActionResult AddItem(long productID, int quantity)
        {
            var product = new ProductDAO().ProductDetail(productID);
            var cart = Session[CartSession];
            if (cart != null)
            {
                var list = (List<CartItem>)cart;
                if (list.Exists(x => x.Product.SanPhamID == productID))
                {
                    foreach (var item in list)
                    {
                        if (item.Product.SanPhamID == productID)
                        {
                            item.Quantity += quantity;
                        }
                    }
                }
                else
                {
                    var item = new CartItem();
                    item.Product = product;
                    item.Quantity = quantity;
                    list.Add(item);

                }
                //Gán vào session
                Session[CartSession] = list;
            }
            else
            {
                //tạo mới đối tượng cart item
                var item = new CartItem();
                item.Product = product;
                item.Quantity = quantity;
                var list = new List<CartItem>();
                list.Add(item);
                Session[CartSession] = list;
            }
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Payment(int Ship)
        {
            FruitShopDbContext db = new FruitShopDbContext();
            var ship = new Ship();
            var gia = db.Ships.Where(y => y.ShipID == Ship).ToList();
            foreach(var item in gia)
            {
                ship.GiaShip = item.GiaShip;
            }
            ViewBag.GiaShip = ship.GiaShip;
            var session = new List<CartItem>();
            session = (List<CartItem>)Session[CartSession];
            foreach (var item in session)
            {
                item.GiaShip = ship.GiaShip;
            }
            Session[CartSession] = session;
            var cart = Session[CartSession];
           
            var list = new List<CartItem>();
            
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            return View(list);
        }
        [HttpPost]
        public ActionResult Payment(string shipName, string mobile, string address, string email)
        {

            var cart = (List<CartItem>)Session[CartSession];
            var order = new Order();
            order.CreateDate = DateTime.Now;
            order.ShipAddress = address;
            order.ShipMobile = mobile;
            order.ShipName = shipName;
            order.ShipEmail = email;
            // lấy id user
            order.Status = true;
            var listSession = new List<CartItem>();
            listSession = (List<CartItem>)Session[Common.CommonConstants.CartSession];
            foreach (var item in listSession)
            {
                order.GiaShip = item.GiaShip;
                break;
            }
            order.TongTien = cart.Sum(x => Convert.ToInt64(x.Product.PromotionPrice) * x.Quantity) + order.GiaShip;
            SanPham sanPham = new SanPham();
            SanPhamDAO sanPhamDAO = new SanPhamDAO();
            try
            {
                var id = new OrderDAO().Insert(order);

                var detailDao = new Model.DAO.OrderDetailDAO();
                decimal? total = order.TongTien;
                foreach (var item in cart)
                {
                    var orderDetail = new OrderDetail();
                    orderDetail.SanPhamID = item.Product.SanPhamID;
                    orderDetail.OrderID = id;
                    orderDetail.DonGia = item.Product.PromotionPrice;
                    orderDetail.Quantity = item.Quantity;
                    orderDetail.ThanhTien = (Convert.ToInt64(orderDetail.DonGia) * item.Quantity).ToString();
                    detailDao.Insert(orderDetail);
                    var soLuong = sanPhamDAO.ListAll().Where(x => x.SanPhamID == orderDetail.SanPhamID).ToList();
                    foreach (var soluong in soLuong)
                    {
                        sanPham.SanPhamID = soluong.SanPhamID;
                        sanPham.Image = soluong.Image;
                        sanPham.TenSanPham = soluong.TenSanPham;
                        sanPham.DonGia = soluong.DonGia;
                        sanPham.PromotionPrice = soluong.PromotionPrice;
                        sanPham.TomTat = soluong.TomTat;
                        sanPham.Description = soluong.Description;
                        sanPham.MetaKeyword = soluong.MetaKeyword;
                        sanPham.Quantity = soluong.Quantity - item.Quantity;
                        sanPham.DanhMucSanPhamID = soluong.DanhMucSanPhamID;
                        sanPham.Status = soluong.Status;
                        sanPhamDAO.Update(sanPham);
                    }
                }
                //string content = System.IO.File.ReadAllText(Server.MapPath("~/Content/Client/Template/neworder.html"));

                //content = content.Replace("{{CustomerName}}", shipName);
                //content = content.Replace("{{Phone}}", mobile);
                //content = content.Replace("{{Email}}", email);
                //content = content.Replace("{{Address}}", address);
                //content = content.Replace("{{Total}}", total.Value.ToString("N0"));
                //var toEmail = ConfigurationManager.AppSettings["ToEmailAddress"].ToString();

                //new MailHelper().SendMail(email, "khách hàng đặt hàng từ FruitShop", content);
                //new MailHelper().SendMail(toEmail, "Đơn hàng mới từ FruitShop", content);
            }
            catch (Exception ex)
            {
                //ghi log
                return Redirect("/Cart/Error");
            }
            Session[CartSession] = null;
            return Redirect("/Cart/Payment");
        }
        public ActionResult Success()
        {
            return View();
        }
        public ActionResult Error()
        {
            return View();
        }
    }
}