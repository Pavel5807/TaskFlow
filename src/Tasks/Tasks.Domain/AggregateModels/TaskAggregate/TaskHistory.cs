using TaskFlow.Tasks.Domain.Seedwork;

namespace TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate;

public class TaskHistory : ValueObject
{
    private Task _taskId;
    private readonly string action;

    public Task TaskId { get; set; }

    public TaskHistory(string action)
    {
        this.action = action;
    }
}