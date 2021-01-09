namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Blog")]
    public partial class Blog
    {
        public long BlogID { get; set; }

        [StringLength(100)]
        public string Image { get; set; }

        [StringLength(50)]
        public string TitleBlog { get; set; }

        public string Content { get; set; }

        public int? DanhMucSanPhamID { get; set; }

        public DateTime? CreateDate { get; set; }

        public long? SanPhamID { get; set; }

        public int? Status { get; set; }
    }
}
