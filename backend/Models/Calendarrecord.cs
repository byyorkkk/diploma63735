using System;
using System.Collections.Generic;

namespace code_API.Models
{

    public partial class Calendarrecord
    {
        public int CalendarRecordId { get; set; }

        public DateOnly Date { get; set; }

        public int MedicationListId { get; set; }

        public int MoodListId { get; set; }

        public int UserId { get; set; }

        public virtual Medicationlist MedicationList { get; set; } = null!;

        public virtual Moodlist MoodList { get; set; } = null!;

        public virtual User User { get; set; } = null!;
    }
}