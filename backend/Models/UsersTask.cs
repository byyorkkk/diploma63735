using System;
using System.Collections.Generic;

namespace code_API.Models
{
    public partial class UsersTask
    {
        public int UserId { get; set; }

        public int TaskId { get; set; }

        public virtual Task Task { get; set; } = null!;

        public virtual User User { get; set; } = null!;
    }
}