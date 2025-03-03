using TaskFlow.Tasks.Domain.Seedwork;

namespace TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate;

public class TaskItem : Entity
{
    private Guid _id;

    private string _description;

    private bool _isCompleted;

    protected TaskItem()
    {
        _id = Guid.Empty;
        _description = string.Empty;
        _isCompleted = false;
    }

    public TaskItem(string description)
    {
        _description = description;
        _isCompleted = false;
    }

    public Guid Id { get => _id; private set => _id = value; }

    public string Description { get => _description; private set => _description = value; }

    public bool IsCompleted { get => _isCompleted; private set => _isCompleted = value; }

    public void Complete()
    {
        _isCompleted = true;
    }

    public void UpdateDescription(string description)
    {
        _description = description;
    }
}
