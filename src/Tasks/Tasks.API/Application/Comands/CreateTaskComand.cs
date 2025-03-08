using MediatR;
using TaskFlow.Tasks.API.Application.Models;

namespace TaskFlow.Tasks.API.Application.Comands;

public class CreateTaskComand : IRequest<IResponse>
{
    public required string Header { get; set; }
    public IEnumerable<TaskItemDTO>? Items { get; set; }
}
