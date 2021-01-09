namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Tag")]
    public partial class Tag
    {
        public int TagID { get; set; }

        [StringLength(100)]
        public string TagName { get; set; }

        public bool? Status { get; set; }
    }
}
