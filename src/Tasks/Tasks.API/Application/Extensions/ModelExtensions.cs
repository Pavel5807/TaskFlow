using TaskFlow.Tasks.API.Application.Models;
using TaskAggregate = TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate;

public static class ModelExtensions
{
    public static TaskDTO ToDTO(this TaskAggregate.Task task)
    {
        return new()
        {
            Id = task.Id,
            Header = task.Header,
            Items = task.Items.Select(ToDTO),
            History = task.History.Select(ToDTO)
        };
    }

    public static TaskItemDTO ToDTO(this TaskAggregate.TaskItem item)
    {
        return new()
        {
            Id = item.Id,
            Description = item.Description
        };
    }

    public static TaskHistoryDTO ToDTO(this TaskAggregate.TaskHistory history)
    {
        return new()
        {
            Action = history.Action
        };
    }
}
