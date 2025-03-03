using Microsoft.EntityFrameworkCore;
using TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate;
using TaskFlow.Tasks.Infrastructure.EntityConfigurations;

namespace TaskFlow.Tasks.Infrastructure;

public class TaskDbContext : DbContext
{
    public TaskDbContext(DbContextOptions options) : base(options) { }

    public DbSet<Task> Tasks { get; set; }

    public DbSet<TaskHistory> TaskHistories { get; set; }

    public DbSet<TaskItem> TaskItems { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.ApplyConfiguration(new TaskEntityTypeConfiguration());
        modelBuilder.ApplyConfiguration(new TaskItemEntityTypeConfiguration());
    }
}
