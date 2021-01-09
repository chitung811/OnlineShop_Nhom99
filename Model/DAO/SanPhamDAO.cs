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
    public class SanPhamDAO
    {
        //declare connection string  
        string cs = ConfigurationManager.ConnectionStrings["FruitShopDbContext"].ConnectionString;

        //Return list of all SanPham  
        public List<SanPhamViewModel> ListAll()
        {
            List<SanPhamViewModel> lst = new List<SanPhamViewModel>();
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("SelectSanPham", con);
                com.CommandType = CommandType.StoredProcedure;
                SqlDataReader rdr = com.ExecuteReader();
                while (rdr.Read())
                {
                    lst.Add(new SanPhamViewModel
                    {
                        SanPhamID = (long)rdr["SanPhamID"],
                        Image = rdr["Image"].ToString(),
                        TenSanPham = rdr["TenSanPham"].ToString(),
                        DonGia = rdr["DonGia"].ToString(),
                        PromotionPrice = rdr["PromotionPrice"].ToString(),
                        TomTat = rdr["TomTat"].ToString(),
                        Description = rdr["Description"].ToString(),
                        MetaKeyword = rdr["MetaKeyword"].ToString(),
                        Quantity = (int)rdr["Quantity"],
                        DanhMucSanPham = rdr["TenDanhMucSanPham"].ToString(),
                        DanhMucSanPhamID = (int)rdr["DanhMucSanPhamID"],
                        Status = (int)rdr["Status"]

                    });
                }
                return lst;
            }
        }
        public List<SanPham> LaySoLuongConLai(int top)
        {
            FruitShopDbContext db = new FruitShopDbContext();
            return db.SanPhams.Where(x => x.Status == 1).OrderBy(x => x.Quantity).Take(top).ToList();
              
        }
        //Method for Adding an SanPham  
        public int Add(SanPham sanp)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("InsertUpdateSanPham", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@SanPhamID", sanp.SanPhamID);
                com.Parameters.AddWithValue("@Image", sanp.Image);
                com.Parameters.AddWithValue("@TenSanPham", sanp.TenSanPham);
                com.Parameters.AddWithValue("@DonGia", sanp.DonGia);
                com.Parameters.AddWithValue("@PromotionPrice", sanp.PromotionPrice);
                com.Parameters.AddWithValue("@TomTat", sanp.TomTat);
                com.Parameters.AddWithValue("@Description", sanp.Description);
                com.Parameters.AddWithValue("@MetaKeyword", sanp.MetaKeyword);
                com.Parameters.AddWithValue("@Quantity", sanp.Quantity);
                com.Parameters.AddWithValue("@DanhMucSanPhamID", sanp.DanhMucSanPhamID);
                com.Parameters.AddWithValue("@Status", sanp.Status);
                com.Parameters.AddWithValue("@Action", "Insert");
                i = com.ExecuteNonQuery();
            }
            return i;
        }

        public int Update(SanPham sanp)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("InsertUpdateSanPham", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@SanPhamID", sanp.SanPhamID);
                com.Parameters.AddWithValue("@Image", sanp.Image);
                com.Parameters.AddWithValue("@TenSanPham", sanp.TenSanPham);
                com.Parameters.AddWithValue("@DonGia", sanp.DonGia);
                com.Parameters.AddWithValue("@PromotionPrice", sanp.PromotionPrice);
                com.Parameters.AddWithValue("@TomTat", sanp.TomTat);
                com.Parameters.AddWithValue("@Description", sanp.Description);
                com.Parameters.AddWithValue("@MetaKeyword", sanp.MetaKeyword);
                com.Parameters.AddWithValue("@Quantity", sanp.Quantity);
                com.Parameters.AddWithValue("@DanhMucSanPhamID", sanp.DanhMucSanPhamID);
                com.Parameters.AddWithValue("@Status", sanp.Status);
                com.Parameters.AddWithValue("@Action", "Update");
                i = com.ExecuteNonQuery();
            }
            return i;
        }

        public int Delete(long SanPhamID)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("DeleteSanPham", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@SanPhamID", SanPhamID);
                i = com.ExecuteNonQuery();
            }
            return i;
        }
    }
}
