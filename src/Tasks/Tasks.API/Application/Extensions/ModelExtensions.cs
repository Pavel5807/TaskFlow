using System.Linq;
using TaskFlow.Tasks.API.Application.Models;
using TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate;

public static class ModelExtensions
{
    public static TaskDTO ToDTO(this Task task)
    {
        return new()
        {
            Id = task.Id,
            Header = task.Header,
            Items = task.Items.Select(ToDTO),
            History = task.History.Select(ToDTO)
        };
    }

    public static TaskItemDTO ToDTO(this TaskItem item)
    {
        return new()
        {
            Description = item.Description
        };
    }

    public static TaskHistoryDTO ToDTO(this TaskHistory history)
    {
        return new()
        {
            Action = history.Action
        };
    }
}
