using System;
using System.Collections.Generic;

namespace code_API.Models
{

    public partial class TaskCategory
    {
        public int TaskId { get; set; }

        public int CategoryId { get; set; }

        public virtual Category Category { get; set; } = null!;

        public virtual Task Task { get; set; } = null!;
    }
}