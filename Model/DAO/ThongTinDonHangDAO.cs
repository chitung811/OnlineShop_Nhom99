using Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Model.DAO
{
    public class ThongTinDonHangDAO
    {
        string cs = ConfigurationManager.ConnectionStrings["FruitShopDbContext"].ConnectionString;

        //Return list of all Blog 
        public List<DonHangViewModel> DonHangChuaGiao(long userID)
        {
            List<DonHangViewModel> lst = new List<DonHangViewModel>();
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("SelectQuanLyDonHang", con);
                com.Parameters.AddWithValue("@UserID", userID);
                com.CommandType = CommandType.StoredProcedure;
                SqlDataReader rdr = com.ExecuteReader();
                while (rdr.Read())
                {
                    DonHangViewModel donHangViewModel = new DonHangViewModel();
                    donHangViewModel.SanPhamID = rdr["SanPhamID"].ToString();
                    donHangViewModel.OrderID = rdr["OrderID"].ToString();
                    donHangViewModel.DonGia = rdr["DonGia"].ToString();
                    donHangViewModel.Quantity = rdr["Quantity"].ToString();
                    donHangViewModel.ThanhTien = rdr["ThanhTien"].ToString();
                    donHangViewModel.CreateDate = (DateTime)rdr["CreateDate"];
                    donHangViewModel.ShipName = rdr["ShipName"].ToString();
                    donHangViewModel.ShipMobile = rdr["ShipMobile"].ToString();
                    donHangViewModel.ShipAddress = rdr["ShipAddress"].ToString();
                    donHangViewModel.ShipEmail = rdr["ShipEmail"].ToString();
                    donHangViewModel.Status = (bool)rdr["Status"];
                    donHangViewModel.UserID = rdr["UserID"].ToString();
                    donHangViewModel.TongTien = rdr["TongTien"].ToString();
                    donHangViewModel.TenSanPham = rdr["TenSanPham"].ToString();
                    lst.Add(donHangViewModel);

                }
                return lst;
            }
        }
        public List<DonHangViewModel> ToanBoDonDatHang(long userID)
        {
            List<DonHangViewModel> lst = new List<DonHangViewModel>();
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("SelectQuanLyDonHang", con);
                com.Parameters.AddWithValue("@UserID", userID);
                com.CommandType = CommandType.StoredProcedure;
                SqlDataReader rdr = com.ExecuteReader();
                while (rdr.Read())
                {
                    DonHangViewModel donHangViewModel = new DonHangViewModel();
                    //donHangViewModel.SanPhamID = rdr["SanPhamID"].ToString();
                    donHangViewModel.OrderID = rdr["OrderID"].ToString();
                    //donHangViewModel.DonGia = rdr["DonGia"].ToString();
                    //donHangViewModel.Quantity = rdr["Quantity"].ToString();
                    //donHangViewModel.ThanhTien = rdr["ThanhTien"].ToString();
                    donHangViewModel.CreateDate = (DateTime)rdr["CreateDate"];
                    donHangViewModel.ShipName = rdr["ShipName"].ToString();
                    donHangViewModel.ShipMobile = rdr["ShipMobile"].ToString();
                    donHangViewModel.ShipAddress = rdr["ShipAddress"].ToString();
                    donHangViewModel.ShipEmail = rdr["ShipEmail"].ToString();
                    donHangViewModel.Status = (bool)rdr["Status"];
                    donHangViewModel.UserID = rdr["UserID"].ToString();
                    donHangViewModel.TongTien = rdr["TongTien"].ToString();
                    //donHangViewModel.TenSanPham = rdr["TenSanPham"].ToString();
                    lst.Add(donHangViewModel);

                }
                return lst;
            }
        }
        public List<DonHangViewModel> DonHangDaGiao(long userID)
        {
            List<DonHangViewModel> lst = new List<DonHangViewModel>();
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("SelectQuanLyDonHangThanhToan", con);
                com.Parameters.AddWithValue("@UserID", userID);
                com.CommandType = CommandType.StoredProcedure;
                SqlDataReader rdr = com.ExecuteReader();
                while (rdr.Read())
                {
                    DonHangViewModel donHangViewModel = new DonHangViewModel();
                    donHangViewModel.SanPhamID = rdr["SanPhamID"].ToString();
                    donHangViewModel.OrderID = rdr["OrderID"].ToString();
                    donHangViewModel.DonGia = rdr["DonGia"].ToString();
                    donHangViewModel.Quantity = rdr["Quantity"].ToString();
                    donHangViewModel.ThanhTien = rdr["ThanhTien"].ToString();
                    donHangViewModel.CreateDate = (DateTime)rdr["CreateDate"];
                    donHangViewModel.ShipName = rdr["ShipName"].ToString();
                    donHangViewModel.ShipMobile = rdr["ShipMobile"].ToString();
                    donHangViewModel.ShipAddress = rdr["ShipAddress"].ToString();
                    donHangViewModel.ShipEmail = rdr["ShipEmail"].ToString();
                    donHangViewModel.Status = (bool)rdr["Status"];
                    donHangViewModel.UserID = rdr["UserID"].ToString();
                    donHangViewModel.TongTien = rdr["TongTien"].ToString();
                    donHangViewModel.TenSanPham = rdr["TenSanPham"].ToString();
                    lst.Add(donHangViewModel);

                }
                return lst;
            }
        }
    }
}
