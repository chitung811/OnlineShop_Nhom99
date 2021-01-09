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
    public class UserDb
    {
        //declare connection string  
        string cs = ConfigurationManager.ConnectionStrings["FruitShopDbContext"].ConnectionString;

        //Return list of all User  
        public List<User> ListAll()
        {
            List<User> lst = new List<User>();
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("Selectuser", con);
                com.CommandType = CommandType.StoredProcedure;
                SqlDataReader rdr = com.ExecuteReader();
                while (rdr.Read())
                {
                    lst.Add(new User
                    {
                        UserID = (long)rdr["UserID"],
                        Gmail = rdr["Gmail"].ToString(),
                        Password = rdr["Password"].ToString(),
                        GroupID = rdr["GroupID"].ToString(),
                        Name = rdr["Name"].ToString(),
                        Address = rdr["Address"].ToString(),
                        Phone = rdr["Phone"].ToString(),
                        Status = Convert.ToBoolean(rdr["Status"])
                        
                    });
                }
                return lst;
            }
        }

        //Method for Adding an User  
        public int Add(User emp)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("InsertUpdateUser", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@UserID", emp.UserID);
                com.Parameters.AddWithValue("@Gmail", emp.Gmail);
                com.Parameters.AddWithValue("@Password", emp.Password);
                com.Parameters.AddWithValue("@GroupID", emp.GroupID);
                com.Parameters.AddWithValue("@Name", emp.Name);
                com.Parameters.AddWithValue("@Address", emp.Address);
                com.Parameters.AddWithValue("@Phone", emp.Phone);
                com.Parameters.AddWithValue("@Status", emp.Status);
                com.Parameters.AddWithValue("@Action", "Insert");
                i = com.ExecuteNonQuery();
            }
            return i;
        }

        //Method for Updating Employee record  
        public int Update(User emp)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("InsertUpdateUser", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@UserID", emp.UserID);
                com.Parameters.AddWithValue("@Gmail", emp.Gmail);
                com.Parameters.AddWithValue("@Password", emp.Password);
                com.Parameters.AddWithValue("@GroupID", emp.GroupID);
                com.Parameters.AddWithValue("@Name", emp.Name);
                com.Parameters.AddWithValue("@Address", emp.Address);
                com.Parameters.AddWithValue("@Phone", emp.Phone);
                com.Parameters.AddWithValue("@Status", emp.Status);
                com.Parameters.AddWithValue("@Action", "Update");
                i = com.ExecuteNonQuery();
            }
            return i;
        }
        public int UpdateLoginFacebook(User emp)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("UpdateLoginFacebook", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@UserID", emp.UserID);
                com.Parameters.AddWithValue("@Password", emp.Password);
                com.Parameters.AddWithValue("@Address", emp.Address);
                com.Parameters.AddWithValue("@Phone", emp.Phone);
                com.Parameters.AddWithValue("@Action", "UpdateFB");
                i = com.ExecuteNonQuery();
            }
            return i;
        }
        //Method for Deleting an Employee  
        public int Delete(long UserID)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("DeleteUser", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@UserID", UserID);
                i = com.ExecuteNonQuery();
            }
            return i;
        }
    }

}

