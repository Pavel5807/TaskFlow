using TaskFlow.Tasks.Domain.Seedwork;

namespace TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate;

public class Task : AggregateRoot
{
    private Guid _id;

    private string _header;

    private ICollection<TaskItem> _items;

    private ICollection<TaskHistory> _history;

    public Task(Guid id, string header)
    {
        _id = id;
        _header = header;
        _items = [];
        _history = [];
    }

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

    public void EditItem(int indexItem, string description)
    {
        var item = _items.ElementAtOrDefault(indexItem) ?? throw new Exception();
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
