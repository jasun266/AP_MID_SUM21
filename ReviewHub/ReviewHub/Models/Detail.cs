using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ReviewHub.Models
{
	public class Detail
	{
		public int Id { get; set; }
		public string Title { get; set; }
		public string Description { get; set; }
		public string Image { get; set; }
		public System.DateTime Created_at { get; set; }
		public Nullable<System.DateTime> ExpirationDate { get; set; }
		public Nullable<int> UserId { get; set; }

		public string Username { get; set; }
		public string Email { get; set; }

		public string Name { get; set; }
		public Nullable<int> AdvertiseCategoryId { get; set; }

		public int AdvertiseId { get; set; }
		public string Country { get; set; }
		public string City { get; set; }
		public string Street { get; set; }
		public string Zip { get; set; }
	}
}