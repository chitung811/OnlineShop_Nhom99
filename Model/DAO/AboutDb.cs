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
    public class AboutDb
    {
        string cs = ConfigurationManager.ConnectionStrings["FruitShopDbContext"].ConnectionString;

        //Return list of all DanhMuc  
        public List<About> ListAll()
        {
            List<About> lst = new List<About>();
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("SelectAbout", con);
                com.CommandType = CommandType.StoredProcedure;
                SqlDataReader rdr = com.ExecuteReader();
                while (rdr.Read())
                {
                    lst.Add(new About
                    {
                        AboutID = (int)rdr["AboutID"],
                        Banner = rdr["Banner"].ToString(),
                        icon = rdr["icon"].ToString(),
                        Image = rdr["Image"].ToString(),
                        ContentProduct = rdr["ContentProduct"].ToString(),
                        Avatar = rdr["Avatar"].ToString(),
                        ContentPeople = rdr["ContentPeople"].ToString(),
                        Name = rdr["Name"].ToString(),
                        HappyCustomer = rdr["HappyCustomer"].ToString(),
                        FarmerName = rdr["FarmerName"].ToString(),
                        Position = rdr["Position"].ToString(),
                        Summary = rdr["Summary"].ToString(),
                    });
                }
                return lst;
            }
        }

        //Method for Adding an DanhMuc  
        public int Add(About ab)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("InsertUpdateAbout", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@AboutID", ab.AboutID);
                com.Parameters.AddWithValue("@Banner", ab.Banner);
                com.Parameters.AddWithValue("@icon", ab.icon);
                com.Parameters.AddWithValue("@Image", ab.Image);
                com.Parameters.AddWithValue("@ContentProduct", ab.ContentProduct);
                com.Parameters.AddWithValue("@Avatar", ab.Avatar);
                com.Parameters.AddWithValue("@ContentPeople", ab.ContentPeople);
                com.Parameters.AddWithValue("@Name", ab.Name);
                com.Parameters.AddWithValue("@HappyCustomer", ab.HappyCustomer);
                com.Parameters.AddWithValue("@FarmerName", ab.FarmerName);
                com.Parameters.AddWithValue("@Position", ab.Position);
                com.Parameters.AddWithValue("@Summary", ab.Summary);
                com.Parameters.AddWithValue("@Action", "Insert");
                i = com.ExecuteNonQuery();
            }
            return i;
        }

        public int Update(About ab)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("InsertUpdateAbout", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@AboutID", ab.AboutID);
                com.Parameters.AddWithValue("@Banner", ab.Banner);
                com.Parameters.AddWithValue("@icon", ab.icon);
                com.Parameters.AddWithValue("@Image", ab.Image);
                com.Parameters.AddWithValue("@ContentProduct", ab.ContentProduct);
                com.Parameters.AddWithValue("@Avatar", ab.Avatar);
                com.Parameters.AddWithValue("@ContentPeople", ab.ContentPeople);
                com.Parameters.AddWithValue("@Name", ab.Name);
                com.Parameters.AddWithValue("@HappyCustomer", ab.HappyCustomer);
                com.Parameters.AddWithValue("@FarmerName", ab.FarmerName);
                com.Parameters.AddWithValue("@Position", ab.Position);
                com.Parameters.AddWithValue("@Summary", ab.Summary);
                com.Parameters.AddWithValue("@Action", "Update");
                i = com.ExecuteNonQuery();
            }
            return i;
        }

        public int Delete(int AboutID)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("DeleteAbout", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@AboutID", AboutID);
                i = com.ExecuteNonQuery();
            }
            return i;
        }
    }
}
