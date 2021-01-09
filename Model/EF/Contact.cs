namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Contact")]
    public partial class Contact
    {
        public int ContactID { get; set; }

        [StringLength(100)]
        public string Address { get; set; }

        [StringLength(15)]
        public string Hotline { get; set; }

        [StringLength(15)]
        public string Call { get; set; }

        [StringLength(50)]
        public string Gmail { get; set; }

        [StringLength(500)]
        public string Description { get; set; }
    }
}
