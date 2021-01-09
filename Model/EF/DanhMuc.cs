namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DanhMuc")]
    public partial class DanhMuc
    {
        public int DanhMucID { get; set; }

        [StringLength(50)]
        public string TenDanhMuc { get; set; }

        [StringLength(250)]
        public string MetaKeyword { get; set; }

        public int? Status { get; set; }
    }
}
