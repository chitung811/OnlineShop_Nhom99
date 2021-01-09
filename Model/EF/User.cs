namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("User")]
    public partial class User
    {
        public long UserID { get; set; }

        [StringLength(50)]
        [Required(ErrorMessage = "Mời Nhập Gmail")]
        public string Gmail { get; set; }

        [StringLength(50)]
        [Required(ErrorMessage = "Mời Nhập Password")]
        [Display(Name = "Mật khẩu")]
        public string Password { get; set; }

        [StringLength(20)]
        [Display(Name = "Nhập phân quyền")]
        public string GroupID { get; set; }

        [StringLength(50)]
        [Required(ErrorMessage = "Mời Nhập Name")]
        [Display(Name = "Tên người dùng")]
        public string Name { get; set; }

        [StringLength(100)]
        [Required(ErrorMessage = "Mời Nhập Address")]
        [Display(Name = "Địa chỉ")]
        public string Address { get; set; }

        [StringLength(15)]
        [Required(ErrorMessage = "Mời Nhập Phone")]
        [Display(Name = "SĐT")]
        public string Phone { get; set; }
        [Required(ErrorMessage = "Mời Nhập Status")]
        [Display(Name = "Trạng thái")]
        public bool Status { get; set; }
    }
}
