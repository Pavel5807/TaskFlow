using MediatR;
using TaskFlow.Tasks.API.Application.Models;

namespace TaskFlow.Tasks.API.Application.Comands;

public class CreateTaskComand : IRequest<IResponse>
{
    public AssigneeInfoDTO? Assignee { get; set; }
    public required string Header { get; set; }
    public IEnumerable<TaskItemDTO>? Items { get; set; }
}
