using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace code_API.Models;

public partial class DemoDbContext : DbContext
{
    public DemoDbContext()
    {
    }

    public DemoDbContext(DbContextOptions<DemoDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Calendarrecord> Calendarrecords { get; set; }= null!;

    public virtual DbSet<Category> Categories { get; set; }= null!;

    public virtual DbSet<Efmigrationshistory> Efmigrationshistories { get; set; }= null!;

    public virtual DbSet<Medication> Medications { get; set; } = null!;

    public virtual DbSet<Medicationlist> Medicationlists { get; set; }= null!;

    public virtual DbSet<Mood> Moods { get; set; }= null!;

    public virtual DbSet<Moodlist> Moodlists { get; set; }= null!;

    public virtual DbSet<Pill> Pills { get; set; }= null!;

    public virtual DbSet<Task> Tasks { get; set; }= null!;

    public virtual DbSet<TaskCategory> TaskCategories { get; set; }= null!;

    public virtual DbSet<User> Users { get; set; }= null!;

    public virtual DbSet<UsersTask> UsersTasks { get; set; }= null!;

    //protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
      
    // => optionsBuilder.UseMySql("Server=localhost;Database=adhd_w63735;Uid=root;Pwd=Karina682557!", Microsoft.EntityFrameworkCore.ServerVersion.Parse("8.0.20-mysql"));

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder
            .UseCollation("utf8mb4_general_ci")
            .HasCharSet("utf8mb4");

        modelBuilder.Entity<Calendarrecord>(entity =>
        {
            entity.HasKey(e => e.CalendarRecordId).HasName("PRIMARY");

            entity
                .ToTable("calendarrecord")
                .UseCollation("utf8mb4_0900_ai_ci");

            entity.HasIndex(e => e.MoodListId, "fk_calendarRecord");

            entity.HasIndex(e => e.MedicationListId, "fk_calendarRecord_medicationList");

            entity.HasIndex(e => e.UserId, "fk_calendarRecord_user");

            entity.Property(e => e.CalendarRecordId).HasColumnName("calendarRecord_ID");
            entity.Property(e => e.Date).HasColumnName("date");
            entity.Property(e => e.MedicationListId).HasColumnName("medicationList_ID");
            entity.Property(e => e.MoodListId).HasColumnName("moodList_ID");
            entity.Property(e => e.UserId).HasColumnName("user_ID");

            entity.HasOne(d => d.MedicationList).WithMany(p => p.Calendarrecords)
                .HasForeignKey(d => d.MedicationListId)
                .HasConstraintName("fk_calendarRecord_medicationList");

            entity.HasOne(d => d.MoodList).WithMany(p => p.Calendarrecords)
                .HasForeignKey(d => d.MoodListId)
                .HasConstraintName("fk_calendarRecord");

            entity.HasOne(d => d.User).WithMany(p => p.Calendarrecords)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("fk_calendarRecord_user");
        });

        modelBuilder.Entity<Category>(entity =>
        {
            entity.HasKey(e => e.CategoryId).HasName("PRIMARY");

            entity
                .ToTable("category")
                .UseCollation("utf8mb4_0900_ai_ci");

            entity.HasIndex(e => e.UserId, "fk_category_user");

            entity.Property(e => e.CategoryId).HasColumnName("category_ID");
            entity.Property(e => e.CategoryName)
                .HasMaxLength(30)
                .HasColumnName("categoryName");
            entity.Property(e => e.UserId).HasColumnName("user_ID");

            entity.HasOne(d => d.User).WithMany(p => p.Categories)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("fk_category_user");
        });

        modelBuilder.Entity<Efmigrationshistory>(entity =>
        {
            entity.HasKey(e => e.MigrationId).HasName("PRIMARY");

            entity
                .ToTable("__efmigrationshistory")
                .UseCollation("utf8mb4_0900_ai_ci");

            entity.Property(e => e.MigrationId).HasMaxLength(150);
            entity.Property(e => e.ProductVersion).HasMaxLength(32);
        });

        modelBuilder.Entity<Medication>(entity =>
        {
            entity.HasKey(e => e.MedicationId).HasName("PRIMARY");

            entity
                .ToTable("medication")
                .UseCollation("utf8mb4_0900_ai_ci");

            entity.HasIndex(e => e.PillId, "fk_medication_pill");

            entity.HasIndex(e => e.UserId, "fk_medication_user_idx");

            entity.Property(e => e.MedicationId)
                .ValueGeneratedNever()
                .HasColumnName("medication_ID");
            entity.Property(e => e.MedicationDesc)
                .HasMaxLength(100)
                .HasColumnName("medicationDesc");
            entity.Property(e => e.NumberOfPills).HasColumnName("numberOfPills");
            entity.Property(e => e.PillId).HasColumnName("pill_ID");
            entity.Property(e => e.UserId).HasColumnName("user_ID");

            entity.HasOne(d => d.Pill).WithMany(p => p.Medications)
                .HasForeignKey(d => d.PillId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_medication_pill");

            entity.HasOne(d => d.User).WithMany(p => p.Medications)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("fk_medication_user");
        });

        modelBuilder.Entity<Medicationlist>(entity =>
        {
            entity.HasKey(e => e.MedicationListId).HasName("PRIMARY");

            entity
                .ToTable("medicationlist")
                .UseCollation("utf8mb4_0900_ai_ci");

            entity.HasIndex(e => e.MedicationId, "fk_medicationList_medication");

            entity.HasIndex(e => e.UserId, "fk_medicationList_user");

            entity.Property(e => e.MedicationListId).HasColumnName("medicationList_ID");
            entity.Property(e => e.MedicationId).HasColumnName("medication_ID");
            entity.Property(e => e.UserId).HasColumnName("user_ID");

            entity.HasOne(d => d.Medication).WithMany(p => p.Medicationlists)
                .HasForeignKey(d => d.MedicationId)
                .HasConstraintName("fk_medicationList_medication");

            entity.HasOne(d => d.User).WithMany(p => p.Medicationlists)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("fk_medicationList_user");
        });

        modelBuilder.Entity<Mood>(entity =>
        {
            entity.HasKey(e => e.MoodId).HasName("PRIMARY");

            entity
                .ToTable("mood")
                .UseCollation("utf8mb4_0900_ai_ci");

            entity.Property(e => e.MoodId).HasColumnName("mood_ID");
            entity.Property(e => e.MoodDescription)
                .HasMaxLength(30)
                .HasColumnName("moodDescription");
            entity.Property(e => e.MoodName)
                .HasColumnType("enum('happy','sad','overwhelmed','active')")
                .HasColumnName("moodName");
        });

        modelBuilder.Entity<Moodlist>(entity =>
        {
            entity.HasKey(e => e.MoodListId).HasName("PRIMARY");

            entity
                .ToTable("moodlist")
                .UseCollation("utf8mb4_0900_ai_ci");

            entity.HasIndex(e => e.MoodId, "fk_moodlist_mood");

            entity.HasIndex(e => e.UserId, "fk_moodlist_user");

            entity.Property(e => e.MoodListId)
                .ValueGeneratedNever()
                .HasColumnName("moodList_ID");
            entity.Property(e => e.MoodId).HasColumnName("mood_ID");
            entity.Property(e => e.UserId).HasColumnName("user_ID");

            entity.HasOne(d => d.Mood).WithMany(p => p.Moodlists)
                .HasForeignKey(d => d.MoodId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_moodlist_mood");

            entity.HasOne(d => d.User).WithMany(p => p.Moodlists)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_moodlist_user");
        });

        modelBuilder.Entity<Pill>(entity =>
        {
            entity.HasKey(e => e.PillId).HasName("PRIMARY");

            entity
                .ToTable("pill")
                .UseCollation("utf8mb4_0900_ai_ci");

            entity.HasIndex(e => e.UserId, "fk_pill_user");

            entity.Property(e => e.PillId).HasColumnName("pill_ID");
            entity.Property(e => e.PillDose).HasColumnName("pillDose");
            entity.Property(e => e.PillName)
                .HasMaxLength(30)
                .HasColumnName("pillName");
            entity.Property(e => e.UserId).HasColumnName("user_ID");

            entity.HasOne(d => d.User).WithMany(p => p.Pills)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("fk_pill_user");
        });

        modelBuilder.Entity<Task>(entity =>
        {
            entity.HasKey(e => e.TaskId).HasName("PRIMARY");

            entity
                .ToTable("task")
                .UseCollation("utf8mb4_0900_ai_ci");

            entity.HasIndex(e => e.UserId, "fk_task_user");

            entity.Property(e => e.TaskId).HasColumnName("task_ID");
            entity.Property(e => e.TaskDescription)
                .HasMaxLength(1000)
                .HasColumnName("taskDescription");
            entity.Property(e => e.TaskName)
                .HasMaxLength(100)
                .HasColumnName("taskName");
            entity.Property(e => e.TaskStatus)
                .HasDefaultValueSql("'To-Do'")
                .HasColumnType("enum('To-Do','In-Process','Done','')")
                .HasColumnName("taskStatus");
            entity.Property(e => e.UserId).HasColumnName("user_ID");

            entity.HasOne(d => d.User).WithMany(p => p.Tasks)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("fk_task_user");
        });

        modelBuilder.Entity<TaskCategory>(entity =>
        {
            entity.HasKey(e => e.TaskId).HasName("PRIMARY");

            entity
                .ToTable("task_category")
                .UseCollation("utf8mb4_0900_ai_ci");

            entity.HasIndex(e => e.CategoryId, "fk_task_category_category");

            entity.HasIndex(e => e.TaskId, "fk_task_category_task");

            entity.Property(e => e.TaskId)
                .ValueGeneratedNever()
                .HasColumnName("task_ID");
            entity.Property(e => e.CategoryId).HasColumnName("category_ID");

            entity.HasOne(d => d.Category).WithMany(p => p.TaskCategories)
                .HasForeignKey(d => d.CategoryId)
                .HasConstraintName("fk_task_category_category");

            entity.HasOne(d => d.Task).WithOne(p => p.TaskCategory)
                .HasForeignKey<TaskCategory>(d => d.TaskId)
                .HasConstraintName("fk_task_category_task");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.UserId).HasName("PRIMARY");

            entity
                .ToTable("user")
                .HasCharSet("utf8")
                .UseCollation("utf8_general_ci");

            entity.HasIndex(e => e.Email, "email").IsUnique();

            entity.Property(e => e.UserId).HasColumnName("user_ID");
            entity.Property(e => e.Email)
                .HasMaxLength(50)
                .HasDefaultValueSql("'0'")
                .HasColumnName("email");
            entity.Property(e => e.PasswordHash)
                .HasMaxLength(128)
                .HasDefaultValueSql("'0'")
                .HasColumnName("password_hash");
            entity.Property(e => e.Salt)
                .HasMaxLength(36)
                .HasDefaultValueSql("'0'")
                .HasColumnName("salt");
            entity.Property(e => e.Username)
                .HasMaxLength(30)
                .HasColumnName("username");
        });

        modelBuilder.Entity<UsersTask>(entity =>
        {
            entity.HasKey(e => e.UserId).HasName("PRIMARY");

            entity
                .ToTable("users_tasks")
                .UseCollation("utf8mb4_0900_ai_ci");

            entity.HasIndex(e => e.TaskId, "fk_users_tasls_task");

            entity.HasIndex(e => e.UserId, "fk_users_tasls_user");

            entity.Property(e => e.UserId)
                .ValueGeneratedNever()
                .HasColumnName("user_ID");
            entity.Property(e => e.TaskId).HasColumnName("task_ID");

            entity.HasOne(d => d.Task).WithMany(p => p.UsersTasks)
                .HasForeignKey(d => d.TaskId)
                .HasConstraintName("fk_users_tasls_task");

            entity.HasOne(d => d.User).WithOne(p => p.UsersTask)
                .HasForeignKey<UsersTask>(d => d.UserId)
                .HasConstraintName("fk_users_tasls_user");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}