using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopFruit.Areas.Admin.Models
{
    public class ProductListView
    {
        public long SanPhamID { get; set; }
        public string Image { get; set; }
        public string TenSanPham { get; set; }
        public string DonGia { get; set; }
        public string PromotionPrice { get; set; }
        public string TomTat { get; set; }
        public string Description { get; set; }
        public string MetaKeyword { get; set; }
        public int Quantity { get; set; }
        public int DanhMucSanPhamID { get; set; }
        public int Status { get; set; }
        public int CountOfProduct { get; set; }
        public PagedList.IPagedList<ProductListView> Courses { get; set; }
    }
}