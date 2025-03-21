using MediatR;
using TaskFlow.Tasks.API.Application.Models;

namespace TaskFlow.Tasks.API.Application.Comands;

public class UpdateTaskComand : IRequest<IResponse>
{
    public Guid Id { get; set; }
    public string? Header { get; set; }
    public AssigneeInfoDTO? Assignee { get; set; }
    public IEnumerable<TaskItemDTO>? Items { get; set; }
}
