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
    public class FooterDb
    {
        string cs = ConfigurationManager.ConnectionStrings["FruitShopDbContext"].ConnectionString;
        public List<Footer> ListAll()
        {
            List<Footer> lst = new List<Footer>();
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("SelectFooter", con);
                com.CommandType = CommandType.StoredProcedure;
                SqlDataReader rdr = com.ExecuteReader();
                while (rdr.Read())
                {
                    lst.Add(new Footer
                    {
                        FooterID = Convert.ToInt32(rdr["FooterID"]),
                        Content = rdr["Content"].ToString(),
                        Status = (bool)rdr["Status"]
                    });
                }
                return lst;
            }
        }

        //Method for Adding an Employee  
        public int Add(Footer ft)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("InsertUpdateFooter", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@FooterID", ft.FooterID);
                com.Parameters.AddWithValue("@Content", ft.Content);
                com.Parameters.AddWithValue("@Status", ft.Status);
                com.Parameters.AddWithValue("@Action", "Insert");
                i = com.ExecuteNonQuery();
            }
            return i;
        }

        //Method for Updating Employee record  
        public int Update(Footer ft)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("InsertUpdateFooter", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@FooterID", ft.FooterID);
                com.Parameters.AddWithValue("@Content", ft.Content);
                com.Parameters.AddWithValue("@Status", ft.Status);
                com.Parameters.AddWithValue("@Action", "Update");
                i = com.ExecuteNonQuery();
            }
            return i;
        }

        //Method for Deleting an Employee  
        public int Delete(int FooterID)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("DeleteFooter", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@FooterID", FooterID);
                i = com.ExecuteNonQuery();
            }
            return i;
        }
    }
}
