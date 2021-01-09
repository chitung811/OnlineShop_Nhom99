namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Order")]
    public partial class Order
    {
        public long OrderID { get; set; }

        public DateTime? CreateDate { get; set; }

        [StringLength(50)]
        public string ShipName { get; set; }

        [StringLength(15)]
        public string ShipMobile { get; set; }

        [StringLength(100)]
        public string ShipAddress { get; set; }

        [StringLength(100)]
        public string ShipEmail { get; set; }

        public bool? Status { get; set; }
        public decimal? GiaShip { get; set; }
        public long? UserID { get; set; }
        public decimal? TongTien { get; set; }
    }
}
