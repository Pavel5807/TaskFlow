using TaskFlow.Tasks.Domain.Seedwork;

namespace TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate;

public class TaskHistory : ValueObject
{
    private string _action;

    protected TaskHistory()
    {
        _action = string.Empty;
    }

    public TaskHistory(string action)
    {
        _action = action;
    }

    public string Action { get => _action; private set => _action = value; }
}
