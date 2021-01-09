namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Slide")]
    public partial class Slide
    {
        public int SlideID { get; set; }

        [Column("slide")]
        [StringLength(50)]
        public string slide1 { get; set; }

        [StringLength(50)]
        public string Image { get; set; }

        [StringLength(50)]
        public string Title { get; set; }

        [StringLength(100)]
        public string Description { get; set; }

        public bool? Status { get; set; }
    }
}
