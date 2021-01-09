using Model.EF;
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
    public class DanhMucSanPhamDAO
    {
        string cs = ConfigurationManager.ConnectionStrings["FruitShopDbContext"].ConnectionString;

        //Return list of all DanhMucSanPham  
        public List<DanhMucSanPhamViewModel> ListAll()
        {
            List<DanhMucSanPhamViewModel> lst = new List<DanhMucSanPhamViewModel>();
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("SelectDanhMucSanPham", con);
                com.CommandType = CommandType.StoredProcedure;
                SqlDataReader rdr = com.ExecuteReader();
                while (rdr.Read())
                {
                    lst.Add(new DanhMucSanPhamViewModel
                    {
                        DanhMucSanPhamID = (int)rdr["DanhMucSanPhamID"],
                        TenDanhMucSanPham = rdr["TenDanhMucSanPham"].ToString(),
                        MetaKeyword = rdr["MetaKeyword"].ToString(),
                        DanhMuc = rdr["TenDanhMuc"].ToString(),
                        Status = (int)rdr["Status"]
                    });
                }
                return lst;
            }
        }

        //Method for Adding an DanhMuc  
        public int Add(DanhMucSanPham dmsp)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("InsertUpdateDanhMucSanPham", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@DanhMucSanPhamID", dmsp.DanhMucSanPhamID);
                com.Parameters.AddWithValue("@TenDanhMucSanPham", dmsp.TenDanhMucSanPham);
                com.Parameters.AddWithValue("@MetaKeyword", dmsp.MetaKeyword);
                com.Parameters.AddWithValue("@DanhMucID", dmsp.DanhMucID);
                com.Parameters.AddWithValue("@Status", dmsp.Status);
                com.Parameters.AddWithValue("@Action", "Insert");
                i = com.ExecuteNonQuery();
            }
            return i;
        }

        public int Update(DanhMucSanPham dmsp)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("InsertUpdateDanhMucSanPham", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@DanhMucSanPhamID", dmsp.DanhMucSanPhamID);
                com.Parameters.AddWithValue("@TenDanhMucSanPham", dmsp.TenDanhMucSanPham);
                com.Parameters.AddWithValue("@MetaKeyword", dmsp.MetaKeyword);
                com.Parameters.AddWithValue("@DanhMucID", dmsp.DanhMucID);
                com.Parameters.AddWithValue("@Status", dmsp.Status);
                com.Parameters.AddWithValue("@Action", "Update");
                i = com.ExecuteNonQuery();
            }
            return i;
        }

        public int Delete(int DanhMucSanPhamID)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("DeleteDanhMucSanPham", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@DanhMucSanPhamID", DanhMucSanPhamID);
                i = com.ExecuteNonQuery();
            }
            return i;
        }
    }
}
