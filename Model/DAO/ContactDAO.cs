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
    public class ContactDAO
    {
        string cs = ConfigurationManager.ConnectionStrings["FruitShopDbContext"].ConnectionString;
 
        public List<Contact> ListAll()
        {
            List<Contact> lst = new List<Contact>();
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("SelectContact", con);
                com.CommandType = CommandType.StoredProcedure;
                SqlDataReader rdr = com.ExecuteReader();
                while (rdr.Read())
                {
                    lst.Add(new Contact
                    {
                        ContactID = (int)rdr["ContactID"],
                        Address = rdr["Address"].ToString(),
                        Hotline = rdr["Hotline"].ToString(),
                        Call = rdr["Call"].ToString(),
                        Gmail = rdr["Gmail"].ToString(),
                        Description = rdr["Description"].ToString()
                    });
                }
                return lst;
            }
        }
        public int Add(Contact ct)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("InsertUpdateContact", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@ContactID", ct.ContactID);
                com.Parameters.AddWithValue("@Address", ct.Address);
                com.Parameters.AddWithValue("@Hotline", ct.Hotline);
                com.Parameters.AddWithValue("@Call", ct.Call);
                com.Parameters.AddWithValue("@Gmail", ct.Call);
                com.Parameters.AddWithValue("@Description", ct.Description);
                com.Parameters.AddWithValue("@Action", "Insert");
                i = com.ExecuteNonQuery();
            }
            return i;
        }

        public int Update(Contact ct)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("InsertUpdateContact", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@ContactID", ct.ContactID);
                com.Parameters.AddWithValue("@Address", ct.Address);
                com.Parameters.AddWithValue("@Hotline", ct.Hotline);
                com.Parameters.AddWithValue("@Call", ct.Call);
                com.Parameters.AddWithValue("@Gmail", ct.Gmail);
                com.Parameters.AddWithValue("@Description", ct.Description);
                com.Parameters.AddWithValue("@Action", "Update");
                i = com.ExecuteNonQuery();
            }
            return i;
        }

        public int Delete(int ContactID)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("DeleteContact", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@ContactID", ContactID);
                i = com.ExecuteNonQuery();
            }
            return i;
        }
    }
}
