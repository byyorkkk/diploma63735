using System;
using System.Collections.Generic;

namespace code_API.Models
{
    public partial class Mood
    {
        public int MoodId { get; set; }

        public string MoodName { get; set; } = null!;

        public string? MoodDescription { get; set; }

        public virtual ICollection<Moodlist> Moodlists { get; } = new List<Moodlist>();
    }
}