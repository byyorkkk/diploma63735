using System;
using System.Collections.Generic;

namespace code_API.Models
{

    public partial class Moodlist
    {
        public int MoodListId { get; set; }

        public int MoodId { get; set; }

        public int UserId { get; set; }

        public virtual ICollection<Calendarrecord> Calendarrecords { get; } = new List<Calendarrecord>();

        public virtual Mood Mood { get; set; } = null!;

        public virtual User User { get; set; } = null!;
    }
}