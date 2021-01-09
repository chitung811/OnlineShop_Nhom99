using Model.EF;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace ShopFruit.Controllers
{
    public class SlideDb
    {
        string cs = ConfigurationManager.ConnectionStrings["FruitShopDbContext"].ConnectionString;

        //Return list of all SLIDE 
        public List<Slide> ListAll()
        {
            List<Slide> lst = new List<Slide>();
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("SelectSlide", con);
                com.CommandType = CommandType.StoredProcedure;
                SqlDataReader rdr = com.ExecuteReader();
                while (rdr.Read())
                {
                    lst.Add(new Slide
                    {
                        SlideID = (int)rdr["SlideID"],
                        slide1 = rdr["Slide"].ToString(),
                        Image = rdr["Image"].ToString(),
                        Title = rdr["Title"].ToString(),
                        Description = rdr["Description"].ToString(),
                        Status = (bool)rdr["Status"]
                    });
                }
                return lst;
            }
        }

        //Method for Adding an slide  
        public int Add(Slide sl)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("InsertUpdateSlide", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@SlideID", sl.SlideID);
                com.Parameters.AddWithValue("@slide", sl.slide1);
                com.Parameters.AddWithValue("@Image", sl.Image);
                com.Parameters.AddWithValue("@Title", sl.Title);
                com.Parameters.AddWithValue("@Description", sl.Description);
                com.Parameters.AddWithValue("@Status", sl.Status);
                com.Parameters.AddWithValue("@Action", "Insert");
                
                i = com.ExecuteNonQuery();
            }
            return i;
        }

        public int Update(Slide sl)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("InsertUpdateSlide", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@SlideID", sl.SlideID);
                com.Parameters.AddWithValue("@slide", sl.slide1);
                com.Parameters.AddWithValue("@Image", sl.Image);
                com.Parameters.AddWithValue("@Title", sl.Title);
                com.Parameters.AddWithValue("@Description", sl.Description);
                com.Parameters.AddWithValue("@Status", sl.Status);
                com.Parameters.AddWithValue("@Action", "Update");
                i = com.ExecuteNonQuery();
            }
            return i;
        }

        public int Delete(long SlideID)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("DeleteSilde", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@SlideID", SlideID);
                i = com.ExecuteNonQuery();
            }
            return i;
        }
    }
}