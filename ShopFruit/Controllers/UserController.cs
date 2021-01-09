using Facebook;
using Model.DAO;
using Model.EF;
using Model.ViewModel;
using ShopFruit.Common;
using ShopFruit.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopFruit.Controllers
{
    public class UserController : Controller
    {
        private string groupID = "MEMBER";
        private Uri RedirectUri
        {
            get
            {
                var uriBuilder = new UriBuilder(Request.Url);
                uriBuilder.Query = null;
                uriBuilder.Fragment = null;
                uriBuilder.Path = Url.Action("FacebookCallback");
                return uriBuilder.Uri;
            }
        }
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult QuanLyDonHang()
        {
            return View();
        }
        public PartialViewResult DonHangDangDat()
        {
            var session = (UserLogin)Session[CommonConstants.USER_SESSION];
            var thongTinDonHangDAO = new ThongTinDonHangDAO();
            ViewBag.DonHangDangDat = thongTinDonHangDAO.DonHangChuaGiao(session.UserID);
            return PartialView();
        }
        public PartialViewResult TatCaDonHang()
        {
            var session = (UserLogin)Session[CommonConstants.USER_SESSION];
            var thongTinDonHangDAO = new ThongTinDonHangDAO();
            ViewBag.TatCaDonHang = thongTinDonHangDAO.ToanBoDonDatHang(session.UserID);
            return PartialView();
        }
        public PartialViewResult DonHangDaGiao()
        {
            var session = (UserLogin)Session[CommonConstants.USER_SESSION];
            var thongTinDonHangDAO = new ThongTinDonHangDAO();
            ViewBag.DonHangDaGiao = thongTinDonHangDAO.DonHangDaGiao(session.UserID);
            return PartialView();

        }
        [HttpGet]
        public ActionResult ChiTietDonHang(string orderID)
        {
            var session = (UserLogin)Session[CommonConstants.USER_SESSION];
            var thongTinDonHangDAO = new ThongTinDonHangDAO();
            var TatCaDonHang = thongTinDonHangDAO.ToanBoDonDatHang(session.UserID);

            DonHangViewModel dHModel = new DonHangViewModel();
            foreach (var item in TatCaDonHang)
            {
                if (item.OrderID.Trim() == orderID.Trim())
                {
                    dHModel.OrderID = item.OrderID;
                    dHModel.SanPhamID = item.SanPhamID;
                    dHModel.DonGia = item.OrderID;
                    dHModel.Quantity = item.Quantity;
                    dHModel.ThanhTien = item.ThanhTien;
                    dHModel.CreateDate = item.CreateDate;
                    dHModel.ShipName = item.ShipName;
                    dHModel.ShipMobile = item.ShipMobile;
                    dHModel.ShipAddress = item.ShipAddress;
                    dHModel.ShipEmail = item.ShipEmail;
                    dHModel.UserID = item.UserID;
                    dHModel.TongTien = item.TongTien;
                    dHModel.TenSanPham = item.TenSanPham;
                    dHModel.Status = item.Status;
                }
            }
            return View(dHModel);

        }
        public ActionResult Login(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDAO();
                var result = dao.Login(model.Gmail, Encryptor.MD5Hash(model.Password));
                if (result == 1)
                {
                    var user = dao.GetByGmail(model.Gmail);
                    var userSession = new UserLogin();
                    userSession.UserID = user.UserID;
                    userSession.Gmail = user.Gmail;
                    userSession.Name = user.Name;
                    userSession.Address = user.Address;
                    userSession.Phone = user.Phone;

                    string groupID = "ADMIN";
                    var Group = dao.GetByGroup(userSession.Gmail, groupID);
                    Session.Add(CommonConstants.USER_SESSION, userSession);
                    if (Group.Count > 0)
                    {
                        return RedirectToAction("Index", "Home_Admin", new { area = "Admin" });
                    }
                    else
                    {
                        return RedirectToAction("Index", "Home");
                    }

                }
                else if (result == 0)
                {
                    ModelState.AddModelError("", "tài khoản không tồn tại");
                }
                else if (result == -1)
                {
                    ModelState.AddModelError("", "tài khoản đang bị khóa");
                }
                else if (result == -2)
                {
                    ModelState.AddModelError("", "Tài khoản mật khẩu không đúng không đúng");
                }
                else
                {
                    ModelState.AddModelError("", "Tài khoản mật khẩu không đúng không đúng");
                }
            }
            return PartialView("Index");
        }
        public ActionResult LoginFacebook()
        {
            var fb = new FacebookClient();
            var loginUrl = fb.GetLoginUrl(new
            {
                client_id = ConfigurationManager.AppSettings["FbAppID"],
                client_secret = ConfigurationManager.AppSettings["FbAppSecret"],
                redirect_uri = RedirectUri.AbsoluteUri,
                response_type = "code",
                scope = "email",
            });
            return Redirect(loginUrl.AbsoluteUri);
        }
        public ActionResult FacebookCallback(string code)
        {
            var fb = new FacebookClient();
            dynamic result = fb.Post("oauth/access_token", new
            {
                client_id = ConfigurationManager.AppSettings["FbAppID"],
                client_secret = ConfigurationManager.AppSettings["FbAppSecret"],
                redirect_uri = RedirectUri.AbsoluteUri,
                code = code
            });
            var accessToken = result.access_token;
            if (!string.IsNullOrEmpty(accessToken))
            {
                fb.AccessToken = accessToken;
                dynamic me = fb.Get("me?fields=first_name,middle_name,last_name,id,email");
                string email = me.email;
                string name = me.first_name + " " + me.middle_name + " " + me.last_name;
                groupID = "MEMBER";
                var user = new User();
                user.Gmail = email;
                user.Password = "NULL";
                user.Phone = "NULL";
                user.Address = "NULL";
                user.GroupID = groupID;
                user.Name = name;
                user.Status = true;
                ViewBag.Email = user.Gmail;
                var resultInsert = new UserDAO().InsertForFacebook(user);
                if (resultInsert > 0)
                {
                    var userSession = new UserLogin();
                    userSession.Gmail = user.Gmail;
                    userSession.UserID = resultInsert;
                    Session.Add(CommonConstants.USER_SESSION, userSession);
                    return View("UpdateLoginFacebook");

                }

            }

            return RedirectToAction("Index", "Home");
        }
        public ActionResult UpdateLoginFacebook(User user)
        {

            var dao = new UserDb();
            var userSession = (UserLogin)Session[CommonConstants.USER_SESSION];
            user.UserID = userSession.UserID;
            user.Password = Encryptor.MD5Hash(user.Password);
            var update = dao.UpdateLoginFacebook(user);
            ViewBag.Update = "Cập nhật thành công";
            return View("Index");
        }

        public ActionResult Logout()
        {
            Session[Common.CommonConstants.USER_SESSION] = null;
            return View("Index");
        }

        public ActionResult Register(RegisterModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDAO();
                if (dao.CheckGmail(model.Gmail))
                {
                    ModelState.AddModelError("", "Gmail đã tồn tại");
                }
                else
                {
                    var user = new User();
                    user.Gmail = model.Gmail;
                    user.Password = Encryptor.MD5Hash(model.Password);
                    user.Name = model.Name;
                    user.Phone = model.Phone;
                    user.Status = true;
                    user.Address = model.Address;
                    var result = dao.Insert(user);
                    if (result > 0)
                    {
                        ViewBag.Success = "Đăng ký thành công";
                        model = new RegisterModel();
                    }
                    else
                    {
                        ViewBag.Success = "Đăng ký không thành công";
                    }
                }
            }
            return View("Index");
        }


    }
}