using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    public class SanPhamViewModel
    {
        public long SanPhamID { get; set; }
        public string Image { get; set; }
        public string TenSanPham { get; set; }
        public string DonGia { get; set; }
        public string PromotionPrice { get; set; }
        public string TomTat { get; set; }
        public string Description { get; set; }
        public string MetaKeyword { get; set; }
        public int? Quantity { get; set; }
        public string DanhMucSanPham { get; set; }
        public int DanhMucSanPhamID { get; set; }
        public int? Status { get; set; }
    }
}
