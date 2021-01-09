using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    public class BlogViewModel
    {
        public long? BlogID { get; set; }
        public string Image { get; set; }
        public string TitleBlog { get; set; }
        public string Content { get; set; }
        public DateTime? CreateDate { get; set; }
        public string image1 { get; set; }
        public string Image2 { get; set; }
        public string Image3 { get; set; }
        public string Image4 { get; set; }
        public string Image5 { get; set; }
        public long SanPhamID { get; set; }
        public string TenSanPham { get; set; }
        public string TomTat { get; set; }
        public int? Status { get; set; }

    }
}
