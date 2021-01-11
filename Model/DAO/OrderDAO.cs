using Model.EF;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Entity.Validation;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class OrderDAO
    {
        string cs = ConfigurationManager.ConnectionStrings["FruitShopDbContext"].ConnectionString;
        FruitShopDbContext db = null;
        public OrderDAO()
        {
            db = new FruitShopDbContext();
        }
        public class FormattedDbEntityValidationException : Exception
        {
            public FormattedDbEntityValidationException(DbEntityValidationException innerException) :
                base(null, innerException)
            {
            }

            public override string Message
            {
                get
                {
                    var innerException = InnerException as DbEntityValidationException;
                    if (innerException != null)
                    {
                        StringBuilder sb = new StringBuilder();

                        sb.AppendLine();
                        sb.AppendLine();
                        foreach (var eve in innerException.EntityValidationErrors)
                        {
                            sb.AppendLine(string.Format("- Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                                eve.Entry.Entity.GetType().FullName, eve.Entry.State));
                            foreach (var ve in eve.ValidationErrors)
                            {
                                sb.AppendLine(string.Format("-- Property: \"{0}\", Value: \"{1}\", Error: \"{2}\"",
                                    ve.PropertyName,
                                    eve.Entry.CurrentValues.GetValue<object>(ve.PropertyName),
                                    ve.ErrorMessage));
                            }
                        }
                        sb.AppendLine();

                        return sb.ToString();
                    }

                    return base.Message;
                }
            }
        }
        public long Insert(Order order)
        {
            db.Orders.Add(order);
            try
            {
                db.SaveChanges();
                return order.OrderID;
            }
            catch (DbEntityValidationException e)
            {
                var newException = new FormattedDbEntityValidationException(e);
                throw newException;
            }
        }


        //Return list of all Order 
        public List<Order> ListAll()
        {
            List<Order> lst = new List<Order>();
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("SelectOrder", con);
                com.CommandType = CommandType.StoredProcedure;
                SqlDataReader rdr = com.ExecuteReader();
                
                while (rdr.Read())
                {
                    var order = new Order();
                    order.OrderID = (long)rdr["OrderID"];
                    order.CreateDate = (DateTime)rdr["CreateDate"];
                    order.ShipAddress = rdr["ShipAddress"].ToString();
                    order.ShipEmail = rdr["ShipEmail"].ToString();
                    order.ShipMobile = rdr["ShipMobile"].ToString();
                    order.ShipName = rdr["ShipName"].ToString();
                    //order.TongTien = (int)rdr["TongTien"];
                    //order.UserID = (long)rdr["UserID"];
                    order.Status = (bool)rdr["Status"];
                    lst.Add(order);
                }
                return lst;
            }
        }
        public int SoLuongDonHang()
        {
            FruitShopDbContext db = new FruitShopDbContext();
            return db.Orders.Where(x => x.Status == true).Count();
        }
        public decimal? TongTien()
        {
            FruitShopDbContext db = new FruitShopDbContext();
            return db.Orders.Where(x => x.Status == false).Sum(x=>x.TongTien);
        }
        public int DonHangDaGiao()
        {
            FruitShopDbContext db = new FruitShopDbContext();
            return db.Orders.Where(x => x.Status == false).Count();
        }
        public int Update(long orderID)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("InsertUpdateOrder", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@OrderID", orderID);
                //com.Parameters.AddWithValue("@CreateDate", order.CreateDate);
                //com.Parameters.AddWithValue("@ShipAddress", order.ShipAddress);
                //com.Parameters.AddWithValue("@ShipEmail", order.ShipEmail);
                //com.Parameters.AddWithValue("@ShipMobile", order.ShipMobile);
                //com.Parameters.AddWithValue("@ShipName", order.ShipName);
                //com.Parameters.AddWithValue("@TongTien", order.TongTien);
                //com.Parameters.AddWithValue("@UserID", order.UserID);
                ///com.Parameters.AddWithValue("@Status", status);
                com.Parameters.AddWithValue("@Action", "Update");
                i = com.ExecuteNonQuery();
            }
            return i;
        }

        public int Delete(long orderID)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("DeleteOrder", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@OrderID", orderID);
                i = com.ExecuteNonQuery();
            }
            return i;
        }
        public Order OrderDetail(long id)
        {
            return db.Orders.Find(id);
        }
    }
}
