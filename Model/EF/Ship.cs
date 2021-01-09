using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.EF
{
    [Table("Ship")]
    public partial class Ship
    {
        [Key]
        public int ShipID { get; set; }
        [StringLength(100)]
        public string Name { get; set; }
        public decimal GiaShip { get; set; }
    }
}
