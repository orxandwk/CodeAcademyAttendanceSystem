//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CodeAcademyAttendanceSystem.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Qr_Codes
    {
        public int qr_codes_id { get; set; }
        public Nullable<System.DateTime> qr_codes_date { get; set; }
        public string qr_codes_value { get; set; }
        public Nullable<bool> qr_codes_status { get; set; }
        public Nullable<int> qr_codes_group_id { get; set; }
    
        public virtual Groups Groups { get; set; }
    }
}
