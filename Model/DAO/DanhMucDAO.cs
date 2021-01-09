using Model.EF;
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
    public class DanhMucDAO
    {
        string cs = ConfigurationManager.ConnectionStrings["FruitShopDbContext"].ConnectionString;

        //Return list of all DanhMuc  
        public List<DanhMuc> ListAll()
        {
            List<DanhMuc> lst = new List<DanhMuc>();
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("SelectDanhMuc", con);
                com.CommandType = CommandType.StoredProcedure;
                SqlDataReader rdr = com.ExecuteReader();
                while (rdr.Read())
                {
                    lst.Add(new DanhMuc
                    {
                        DanhMucID = (int)rdr["DanhMucID"],
                        TenDanhMuc = rdr["TenDanhMuc"].ToString(),
                        MetaKeyword = rdr["MetaKeyword"].ToString(),
                        Status = (int)rdr["Status"]
                    });
                }
                return lst;
            }
        }

        //Method for Adding an DanhMuc  
        public int Add(DanhMuc dmuc)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("InsertUpdateDanhMuc", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@DanhMucID", dmuc.DanhMucID);
                com.Parameters.AddWithValue("@TenDanhMuc", dmuc.TenDanhMuc);
                com.Parameters.AddWithValue("@MetaKeyword", dmuc.MetaKeyword);
                com.Parameters.AddWithValue("@Status", dmuc.Status);
                com.Parameters.AddWithValue("@Action", "Insert");
                i = com.ExecuteNonQuery();
            }
            return i;
        }

        public int Update(DanhMuc dmuc)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("InsertUpdateDanhMuc", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@DanhMucID", dmuc.DanhMucID);
                com.Parameters.AddWithValue("@TenDanhMuc", dmuc.TenDanhMuc);
                com.Parameters.AddWithValue("@MetaKeyword", dmuc.MetaKeyword);
                com.Parameters.AddWithValue("@Status", dmuc.Status);
                com.Parameters.AddWithValue("@Action", "Update");
                i = com.ExecuteNonQuery();
            }
            return i;
        }

        public int Delete(int DanhMucID)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("DeleteDanhMuc", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@DanhMucID", DanhMucID);
                i = com.ExecuteNonQuery();
            }
            return i;
        }
    }
}
