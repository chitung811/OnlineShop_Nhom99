using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopFruit.Common
{
    //[Serializable]
    public class UserLogin
    {
        public long UserID { get; set; }
        public string Gmail { get; set; }
        public string GroupID { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public string Name { get; set; }

    }
}