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
    
    public partial class Invoice_Equipment
    {
        public int InvoiceEquipment_ID { get; set; }
        public int Invoice_ID { get; set; }
        public int Equipment_ID { get; set; }
    
        public virtual Equipment Equipment { get; set; }
        public virtual Invoice Invoice { get; set; }
    }
}