using System;
using System.Collections.Generic;

namespace code_API.Models
{

    public partial class User
    {
        public int UserId { get; set; }

        public string Username { get; set; } = null!;

        public string Email { get; set; } = null!;

        public string Salt { get; set; } = null!;

        public string PasswordHash { get; set; } = null!;

        public virtual ICollection<Calendarrecord> Calendarrecords { get; } = new List<Calendarrecord>();

        public virtual ICollection<Category> Categories { get; } = new List<Category>();

        public virtual ICollection<Medicationlist> Medicationlists { get; } = new List<Medicationlist>();

        public virtual ICollection<Medication> Medications { get; } = new List<Medication>();

        public virtual ICollection<Moodlist> Moodlists { get; } = new List<Moodlist>();

        public virtual ICollection<Pill> Pills { get; } = new List<Pill>();

        public virtual ICollection<Task> Tasks { get; } = new List<Task>();

        public virtual UsersTask? UsersTask { get; set; }
    }
}