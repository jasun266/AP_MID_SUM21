using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BEL
{
	 public class ProductModel
	{
        public int id { get; set; }
        public string name { get; set; }
        public int category_id { get; set; }
        public decimal price { get; set; }
        public Nullable<int> qty { get; set; }
        public string description { get; set; }
        public string categoryName { get; set; }
    }
}
