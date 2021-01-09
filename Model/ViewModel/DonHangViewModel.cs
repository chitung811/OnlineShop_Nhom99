using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Model.ViewModel
{
    public class DonHangViewModel
    {
        [Key]
        [Display(Name ="Đơn Hàng ID")]
        public string OrderID { get; set; }
        [Display(Name = "Sản Phẩm ID")]
        public string SanPhamID { get; set; }
        [Display(Name = "Đơn Giá")]
        public string DonGia { get; set; }
        [Display(Name = "Số Lượng")]
        public string Quantity { get; set; }
        [Display(Name = "Thành Tiền")]
        public string ThanhTien { get; set; }
        [Display(Name = "Ngày Đặt Hàng")]
        public DateTime? CreateDate { get; set; }
        [Display(Name = "Tên Người Đặt")]
        public string ShipName { get; set; }
        [Display(Name = "Số Điện Thoại ")]
        public string ShipMobile { get; set; }
        [Display(Name = "Địa Chỉ Đặt Hàng")]
        public string ShipAddress { get; set; }
        [Display(Name = "Email")]
        public string ShipEmail { get; set; }
        [Display(Name = "Trạng Thái")]
        public bool? Status { get; set; }
        [Display(Name = "Người Dùng ID")]
        public string UserID { get; set; }
        [Display(Name = "Tổng Tiền")]
        public string TongTien { get; set; }
        [Display(Name = "Tên Sản Phẩm")]
        public string TenSanPham { get; set; }
    }
}