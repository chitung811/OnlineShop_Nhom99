namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("AnhSanPham")]
    public partial class AnhSanPham
    {
        public long AnhSanPhamID { get; set; }

        [StringLength(50)]
        public string image1 { get; set; }

        [StringLength(50)]
        public string Image2 { get; set; }

        [StringLength(50)]
        public string Image3 { get; set; }

        [StringLength(50)]
        public string Image4 { get; set; }

        [StringLength(50)]
        public string Image5 { get; set; }

        public long? SanPhamID { get; set; }

        public long? BlogID { get; set; }
    }
}
