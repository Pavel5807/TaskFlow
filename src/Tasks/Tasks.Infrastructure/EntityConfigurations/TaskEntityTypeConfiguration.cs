using System;
using System.Text.Json;
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

        entity.Property(task => task.Assignee)
            .HasColumnType("jsonb")
            .HasConversion(
                value => JsonSerializer.Serialize(value, JsonSerializerOptions.Default),
                value => JsonSerializer.Deserialize<AssigneeInfo>(value, JsonSerializerOptions.Default)
            );

        entity.OwnsMany(task => task.History, history =>
            {
                history.WithOwner().HasForeignKey("TaskId");
                history.Property<Guid>("Id");
                history.HasKey("Id");
                history.Property(history => history.Action);
            });
    }
}
