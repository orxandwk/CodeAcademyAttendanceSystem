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
    
    public partial class Teachers
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Teachers()
        {
            this.Groups = new HashSet<Groups>();
            this.Teacher_Roles = new HashSet<Teacher_Roles>();
        }
    
        public int teacher_id { get; set; }
        public string teacher_email { get; set; }
        public string teacher_password { get; set; }
        public string teacher_name { get; set; }
        public string teacher_surname { get; set; }
        public string teacher_phone { get; set; }
        public string teacher_photo { get; set; }
        public Nullable<int> teacher_gender_id { get; set; }
    
        public virtual Genders Genders { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Groups> Groups { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Teacher_Roles> Teacher_Roles { get; set; }
    }
}
