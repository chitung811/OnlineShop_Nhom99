namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Comment")]
    public partial class Comment
    {
        public long CommentID { get; set; }

        [StringLength(500)]
        public string Content { get; set; }

        public long? UserID { get; set; }

        public long? BlogID { get; set; }

        public bool? Status { get; set; }
    }
}
