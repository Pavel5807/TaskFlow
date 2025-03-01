using TaskFlow.Tasks.Domain.Seedwork;

namespace TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate;

public class TaskItem : Entity
{
    private Guid _id;
    private string _description;
    private bool _isCompleted;

    private Task _taskId;

    public Guid Id { get; set; }
    public Task TaskId { get; set; }

    public TaskItem(string description)
    {
        _description = description;
        _isCompleted = false;
    }

    public void Complete()
    {
        _isCompleted = true;
    }

    internal void UpdateDescription(string description)
    {
        _description = description;
    }
}