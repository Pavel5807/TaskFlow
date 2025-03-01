using MediatR;

public class CreateTaskComand : IRequest<bool>
{
    public Guid Id { get; internal set; }
    public string Header { get; internal set; }
    public IEnumerable<TaskItemDTO> Items { get; internal set; }
}
