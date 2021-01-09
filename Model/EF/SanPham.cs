namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SanPham")]
    public partial class SanPham
    {
        public long SanPhamID { get; set; }

        [StringLength(100)]
        public string Image { get; set; }

        [StringLength(100)]
        public string TenSanPham { get; set; }

        [StringLength(10)]
        public string DonGia { get; set; }

        [StringLength(10)]
        public string PromotionPrice { get; set; }

        [StringLength(500)]
        public string TomTat { get; set; }

        public string Description { get; set; }

        [StringLength(250)]
        public string MetaKeyword { get; set; }

        public int? Quantity { get; set; }

        public int? DanhMucSanPhamID { get; set; }

        public int? Status { get; set; }
    }
}
