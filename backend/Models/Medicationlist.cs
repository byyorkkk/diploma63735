using System;
using System.Collections.Generic;

namespace code_API.Models
{

    public partial class Medicationlist
    {
        public int MedicationListId { get; set; }

        public int MedicationId { get; set; }

        public int UserId { get; set; }

        public virtual ICollection<Calendarrecord> Calendarrecords { get; } = new List<Calendarrecord>();

        public virtual Medication Medication { get; set; } = null!;

        public virtual User User { get; set; } = null!;
    }
}