using System;
using System.Collections.Generic;

namespace code_API.Models
{

    public partial class Medication
    {
        public int MedicationId { get; set; }

        public int PillId { get; set; }

        public int? NumberOfPills { get; set; }

        public string? MedicationDesc { get; set; }

        public int UserId { get; set; }

        public virtual ICollection<Medicationlist> Medicationlists { get; } = new List<Medicationlist>();

        public virtual Pill Pill { get; set; } = null!;

        public virtual User User { get; set; } = null!;
    }
}