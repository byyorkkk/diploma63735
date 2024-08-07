using System;
using System.Collections.Generic;

namespace code_API.Models
{

    public partial class Category
    {
        public int CategoryId { get; set; }

        public string CategoryName { get; set; } = null!;

        public int UserId { get; set; }

        public virtual ICollection<TaskCategory> TaskCategories { get; } = new List<TaskCategory>();

        public virtual User User { get; set; } = null!;
    }
}