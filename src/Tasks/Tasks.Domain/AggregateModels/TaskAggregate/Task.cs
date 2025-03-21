using TaskFlow.Tasks.Domain.Seedwork;

namespace TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate;

public class Task : AggregateRoot
{
    private Guid _id;

    private string _header;

    private ICollection<TaskItem> _items;

    private ICollection<TaskHistory> _history;

    private AssigneeInfo? _assignne;

    public Task(string header)
    {
        _header = header;
        _items = [];
        _history = [];
    }

    public AssigneeInfo? Assignee { get => _assignne; private set => _assignne = value; }

    public Guid Id { get => _id; private set => _id = value; }

    public string Header { get => _header; private set => _header = value; }

    public IEnumerable<TaskItem> Items { get => _items; }

    public IEnumerable<TaskHistory> History { get => _history; }

    public void AddItem(string description)
    {
        var item = new TaskItem(description);
        _items.Add(item);

        AddHistory("Item was added");
    }

    public void AssignTo(string username, string email)
    {
        _assignne = new AssigneeInfo(username, email);
        
        AddHistory("Assignne was updated");
    }

    public void EditHeader(string header)
    {
        _header = header;

        AddHistory("Task was changed");
    }

    public void EditItem(Guid id, string description)
    {
        var item = _items.FirstOrDefault(item => item.Id == id) ?? throw new Exception();
        item.UpdateDescription(description);

        AddHistory("Item was changed");
    }

    public void RemoveItem(int indexItem)
    {
        var item = _items.ElementAtOrDefault(indexItem) ?? throw new Exception();
        _items.Remove(item);

        AddHistory("Item was deleted");
    }

    public void CompleteItem(int indexItem)
    {
        var item = _items.ElementAtOrDefault(indexItem) ?? throw new Exception();
        item.Complete();

        AddHistory("Item was closed");
    }

    private void AddHistory(string action)
    {
        var taskHistory = new TaskHistory(action);
        _history.Add(taskHistory);
    }
}
