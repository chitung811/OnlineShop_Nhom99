namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("About")]
    public partial class About
    {
        public int AboutID { get; set; }

        [StringLength(50)]
        public string Banner { get; set; }

        [StringLength(50)]
        public string icon { get; set; }

        [StringLength(50)]
        public string Image { get; set; }

        [StringLength(500)]
        public string ContentProduct { get; set; }

        [StringLength(50)]
        public string Avatar { get; set; }

        [StringLength(500)]
        public string ContentPeople { get; set; }

        [StringLength(50)]
        public string Name { get; set; }

        [StringLength(50)]
        public string HappyCustomer { get; set; }

        [StringLength(50)]
        public string FarmerName { get; set; }

        [StringLength(50)]
        public string Position { get; set; }

        [StringLength(500)]
        public string Summary { get; set; }
    }
}
