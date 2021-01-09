namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DanhGia")]
    public partial class DanhGia
    {
        public long DanhGiaID { get; set; }

        public long? UserID { get; set; }

        public long? SanPhamID { get; set; }

        public int? Rate { get; set; }

        [StringLength(500)]
        public string YourReview { get; set; }

        public bool? Status { get; set; }
    }
}
