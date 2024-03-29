//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RentalManagement.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Rental
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Rental()
        {
            this.Invoices = new HashSet<Invoice>();
        }
    
        public int Rental_ID { get; set; }
        public Nullable<System.DateTime> Receive_Date { get; set; }
        public Nullable<System.TimeSpan> Receive_hr { get; set; }
        public Nullable<System.DateTime> Return_Date { get; set; }
        public Nullable<System.TimeSpan> Return_hr { get; set; }
        public Nullable<int> Rental_rate { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Invoice> Invoices { get; set; }
    }
}
