using Model.EF;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class OrderDetailDAO
    {
        FruitShopDbContext db = null;
        public OrderDetailDAO()
        {
            db = new FruitShopDbContext();
        }
        string cs = ConfigurationManager.ConnectionStrings["FruitShopDbContext"].ConnectionString;
        public bool Insert(OrderDetail detail)
        {
            try
            {
                db.OrderDetails.Add(detail);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;

            }
        }
        public List<OrderDetail> ListAll()
        {
            List<OrderDetail> lst = new List<OrderDetail>();
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("SelectOrderDetail", con);
                com.CommandType = CommandType.StoredProcedure;
                SqlDataReader rdr = com.ExecuteReader();
                while (rdr.Read())
                {
                    lst.Add(new OrderDetail
                    {
                        SanPhamID = (long)rdr["SanPhamID"],
                        OrderID = (long)rdr["OrderID"],
                        DonGia = rdr["DonGia"].ToString(),
                        Quantity = (int)rdr["Quantity"],
                        ThanhTien = rdr["ThanhTien"].ToString()

                    });
                }
                return lst;
            }
        }

    }
}
