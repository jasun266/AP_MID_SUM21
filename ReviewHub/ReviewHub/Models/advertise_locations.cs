//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ReviewHub.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class advertise_locations
    {
        public int Id { get; set; }
        public int AdvertiseId { get; set; }
        public string Country { get; set; }
        public string City { get; set; }
        public string Street { get; set; }
        public string Zip { get; set; }
        public Nullable<int> Lat { get; set; }
        public Nullable<int> Lon { get; set; }
        public string Additional { get; set; }
    
        public virtual advertis advertis { get; set; }
    }
}
