using System;
using System.Collections.Generic;

namespace code_API.Models
{

    public partial class Task
    {
        public int TaskId { get; set; }

        public string TaskName { get; set; } = null!;

        public string TaskStatus { get; set; } = null!;

        public string? TaskDescription { get; set; }

        public int UserId { get; set; }

        public virtual TaskCategory? TaskCategory { get; set; }

        public virtual User User { get; set; } = null!;

        public virtual ICollection<UsersTask> UsersTasks { get; } = new List<UsersTask>();
    }
}