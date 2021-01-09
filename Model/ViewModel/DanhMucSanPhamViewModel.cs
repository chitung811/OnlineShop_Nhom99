using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    public class DanhMucSanPhamViewModel
    {
        public int DanhMucSanPhamID { get; set; }
        public string TenDanhMucSanPham { get; set; }
        public string MetaKeyword { get; set; }
        public string DanhMuc { get; set; }
        public int? Status { get; set; }
    }
}
