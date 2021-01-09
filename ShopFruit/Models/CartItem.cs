using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopFruit.Models
{
    [Serializable]
    public class CartItem
    {
        public SanPham Product { get; set; }
        public int Quantity { get; set; }
        public decimal GiaShip { get; set; }
    }
}