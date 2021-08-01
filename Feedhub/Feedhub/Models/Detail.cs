using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Feedhub.Models
{
	public class Detail
	{
		public int ID { get; set; }
		public System.DateTime Date { get; set; }
		public string Discription { get; set; }
		public string Name { get; set; }
		public int Price { get; set; }
		public string Image { get; set; }
		public int advertiser_id { get; set; }

		public string Country { get; set; }
		public string City { get; set; }
		public string Thana { get; set; }
		public string Area { get; set; }

		public string Email1 { get; set; }

		public int PhoneNumber { get; set; }
	}
}