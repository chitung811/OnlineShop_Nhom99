using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ShopFruit.Models
{
    public class LoginModel
    {
        [Required(ErrorMessage = "Mời nhập Gmail")]
        [RegularExpression(@"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}", ErrorMessage = "Định dạng Email sai")]
        public string Gmail { get; set; }

        [Required(ErrorMessage = "Mời Nhập Password")]
        public string Password { get; set; }

        public string Phone { get; set; }

        public string GroupID { get; set; }

        public bool RememberMe { get; set; }

    }
   
}