namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DanhMucSanPham")]
    public partial class DanhMucSanPham
    {
        public int DanhMucSanPhamID { get; set; }

        [StringLength(100)]
        public string TenDanhMucSanPham { get; set; }

        [StringLength(250)]
        public string MetaKeyword { get; set; }

        public int? DanhMucID { get; set; }

        public int? Status { get; set; }
    }
}
