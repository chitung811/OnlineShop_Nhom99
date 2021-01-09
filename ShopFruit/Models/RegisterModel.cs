using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace ShopFruit.Models
{
    public class RegisterModel
    {   
        [Key]
        public long UserID { get; set; }
        [Required(ErrorMessage ="Chưa nhập Email")]

        [RegularExpression(@"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}",ErrorMessage ="Định dạng Email sai")]
        public string Gmail { get; set; }

        [StringLength(50,MinimumLength =6,ErrorMessage ="Độ dài mật khẩu lớn hơn 6 ký tự")]
        [Required(ErrorMessage ="Chưa nhập Mật khẩu")]
        public string Password { get; set; }

        [Required(ErrorMessage ="Chưa nhập mật khẩu xác nhận")]
        [Compare("Password",ErrorMessage ="Mật khẩu xác nhận không đúng")]
        public string ConfirmPassword { get; set; }

        public string Name { get; set; }
        public string Address { get; set; }
        [RegularExpression(@"(\+84|0)\d{9,10}", ErrorMessage ="Chỉ nhập số điện thoại")]
        public string Phone { get; set; }
    }
}