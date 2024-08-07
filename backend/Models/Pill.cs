using System;
using System.Collections.Generic;

namespace code_API.Models
{

    public partial class Pill
    {
        public int PillId { get; set; }

        public string PillName { get; set; } = null!;

        public int PillDose { get; set; }

        public int UserId { get; set; }

        public virtual ICollection<Medication> Medications { get; } = new List<Medication>();

        public virtual User User { get; set; } = null!;
    }
}