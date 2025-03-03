using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate;

namespace TaskFlow.Tasks.Infrastructure.EntityConfigurations;

internal class TaskEntityTypeConfiguration : IEntityTypeConfiguration<Task>
{
    public void Configure(EntityTypeBuilder<Task> entity)
    {
        entity.HasKey(task => task.Id);

        entity.Property(task => task.Header)
            .IsRequired();

        entity.OwnsMany(task => task.History, history =>
            {
                history.WithOwner().HasForeignKey("TaskId");
                history.Property<Guid>("Id");
                history.HasKey("Id");
                history.Property(history => history.Action);
            });
    }
}
