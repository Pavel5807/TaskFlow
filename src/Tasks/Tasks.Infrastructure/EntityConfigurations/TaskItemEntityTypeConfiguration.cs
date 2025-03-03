using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate;

namespace TaskFlow.Tasks.Infrastructure.EntityConfigurations;

internal class TaskItemEntityTypeConfiguration : IEntityTypeConfiguration<TaskItem>
{
    public void Configure(EntityTypeBuilder<TaskItem> entity)
    {
        entity.HasKey(t => t.Id);

        entity.Property(t => t.Description)
            .IsRequired();

        entity.Property(t => t.IsCompleted);
    }
}
