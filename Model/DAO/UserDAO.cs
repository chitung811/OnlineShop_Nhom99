using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;

namespace Model.DAO
{
    public class UserDAO
    {
        FruitShopDbContext db = null;
        public UserDAO()
        {
            db = new FruitShopDbContext();

        }
        public long Insert(User entity)
        {
            db.Users.Add(entity);
            db.SaveChanges();
            return entity.UserID;
        }
        public long InsertForFacebook(User entity)
        {
            var user = db.Users.SingleOrDefault(x => x.Gmail == entity.Gmail);
            if(user == null)
            {
                db.Users.Add(entity);
                db.SaveChanges();
                return entity.UserID;
            }
            else
            {
                return user.UserID;
            }
        }
        public long InsertMessage(MessageContact entity)
        {
            db.MessageContacts.Add(entity);
            db.SaveChanges();
            return entity.MessageContactID;
        }

        public User GetByGmail(string gmail)
        {
            return db.Users.SingleOrDefault(x => x.Gmail == gmail);
        }
        public List<User> GetByGroup(string gmail,string groupID)
        {
            return db.Users.Where(x => x.Gmail == gmail && x.GroupID ==groupID).ToList();
        }
        public int Login(string gmail, string password)
        {
            var result = db.Users.SingleOrDefault(x => x.Gmail == gmail);

            if (result == null)
            {
                return 0;
            }
            else
            {
                if(result.Status == false)
                {
                    return -1;
                }
                else
                {
                    if (result.Password == password)
                        return 1;
                    else
                        return -2;
                }
            }
        }
        public bool CheckGmail(string gmail)
        {
            return db.Users.Count(x => x.Gmail == gmail) > 0;
        }
    }
}
