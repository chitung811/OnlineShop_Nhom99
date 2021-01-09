using Model.EF;
using Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class BlogDAO
    {
        //declare connection string  
        string cs = ConfigurationManager.ConnectionStrings["FruitShopDbContext"].ConnectionString;

        //Return list of all Blog 
        public List<BlogViewModel> ListAll()
        {
            List<BlogViewModel> lst = new List<BlogViewModel>();
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("SelectBlog", con);
                com.CommandType = CommandType.StoredProcedure;
                SqlDataReader rdr = com.ExecuteReader();
                while (rdr.Read())
                {
                    lst.Add(new BlogViewModel
                    {
                        BlogID = (long)rdr["BlogID"],
                        Image = rdr["Image"].ToString(),
                        TitleBlog = rdr["TitleBlog"].ToString(),
                        Content = rdr["Content"].ToString(),
                        CreateDate = (DateTime)rdr["CreateDate"],
                        image1 = rdr["image1"].ToString(),
                        Image2 = rdr["Image2"].ToString(),
                        Image3 = rdr["Image3"].ToString(),
                        Image4 = rdr["Image4"].ToString(),
                        Image5 = rdr["Image5"].ToString(),
                        SanPhamID = (long)rdr["SanPhamID"],
                        TenSanPham = rdr["TenSanPham"].ToString(),
                        TomTat = rdr["TomTat"].ToString()
                        
                    });
                    
                }
                return lst;
            }
        }
        public int SoLuongBlog()
        {
            FruitShopDbContext db = new FruitShopDbContext();
            return db.Blogs.Where(x => x.Status == 1).Count();
        }
        public List<Blog> List()
        {
            List<Blog> lst = new List<Blog>();
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("SelectBlogAdmin", con);
                com.CommandType = CommandType.StoredProcedure;
                SqlDataReader rdr = com.ExecuteReader();
                while (rdr.Read())
                {
                    lst.Add(new Blog
                    {
                        BlogID = (long)rdr["BlogID"],
                        Image = rdr["Image"].ToString(),
                        Content = rdr["Content"].ToString(),
                        CreateDate = (DateTime)rdr["CreateDate"],
                        DanhMucSanPhamID = (int)rdr["DanhMucSanPhamID"],
                        SanPhamID = (long)rdr["SanPhamID"],
                        TitleBlog = rdr["TitleBlog"].ToString(),
                        Status = (int)rdr["Status"]

                    });
                }
                return lst;
            }
        }
        public BlogViewModel BlogDetail(long id )
        {
            BlogViewModel lst = new BlogViewModel();
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("SelectBlogDetail", con);
                com.Parameters.AddWithValue("@BlogID", id);
                com.CommandType = CommandType.StoredProcedure;

                SqlDataReader rdr = com.ExecuteReader();
                while (rdr.Read())
                {
                    lst.BlogID = (long)rdr["BlogID"];
                    lst.Image = rdr["Image"].ToString();
                    lst.TitleBlog = rdr["TitleBlog"].ToString();
                    lst.Content = rdr["Content"].ToString();
                    lst.CreateDate = (DateTime)rdr["CreateDate"];
                    lst.image1 = rdr["image1"].ToString();
                    lst.Image2 = rdr["Image2"].ToString();
                    lst.Image3 = rdr["Image3"].ToString();
                    lst.Image4 = rdr["Image4"].ToString();
                    lst.Image5 = rdr["Image5"].ToString();
                    lst.SanPhamID = (long)rdr["SanPhamID"];
                    lst.TenSanPham = rdr["TenSanPham"].ToString();
                    lst.TomTat = rdr["TomTat"].ToString();

                }
                return lst;
            }

        }
        public int Add(Blog bl)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("InsertUpdateBlog", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@BlogID", bl.BlogID);
                com.Parameters.AddWithValue("@Image", bl.Image);
                com.Parameters.AddWithValue("@TitleBlog", bl.TitleBlog);
                com.Parameters.AddWithValue("@Content", bl.Content);
                com.Parameters.AddWithValue("@DanhMucSanPhamID", bl.DanhMucSanPhamID);
                com.Parameters.AddWithValue("@CreateDate", bl.CreateDate);
                com.Parameters.AddWithValue("@SanPhamID", bl.SanPhamID);
                com.Parameters.AddWithValue("@Status", bl.Status);
                com.Parameters.AddWithValue("@Action", "Insert");
                i = com.ExecuteNonQuery();
            }
            return i;
        }

        public int Update(Blog bl)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("InsertUpdateBlog", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@BlogID", bl.BlogID);
                com.Parameters.AddWithValue("@Image", bl.Image);
                com.Parameters.AddWithValue("@TitleBlog", bl.TitleBlog);
                com.Parameters.AddWithValue("@Content", bl.Content);
                com.Parameters.AddWithValue("@DanhMucSanPhamID", bl.DanhMucSanPhamID);
                com.Parameters.AddWithValue("@CreateDate", bl.CreateDate);
                com.Parameters.AddWithValue("@SanPhamID", bl.SanPhamID);
                com.Parameters.AddWithValue("@Status", bl.Status);
                com.Parameters.AddWithValue("@Action", "Update");
                i = com.ExecuteNonQuery();
            }
            return i;
        }

        public int Delete(int BlogID)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("DeleteBlog", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@BlogID", BlogID);
                i = com.ExecuteNonQuery();
            }
            return i;
        }
    }
}
