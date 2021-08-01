using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
	 public class CategoryRepo
	{
        static IMSEntities1 context;
        static CategoryRepo()
        {
            context = new IMSEntities1();
        }

        public static List<category> GetCategories()
        {
            return context.categories.ToList();
        }
        public static void AddCategory(category d)
        {
            context.categories.Add(d);
            context.SaveChanges();
        }

       
    }
}
