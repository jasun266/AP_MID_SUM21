//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Feedhub.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Email
    {
        public int ID { get; set; }
        public string Email1 { get; set; }
        public int Address_id { get; set; }
    
        public virtual AccountInfo AccountInfo { get; set; }
    }
}