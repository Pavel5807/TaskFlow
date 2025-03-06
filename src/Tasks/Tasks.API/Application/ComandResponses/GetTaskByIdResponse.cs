using TaskFlow.Tasks.API.Application.Models;

namespace TaskFlow.Tasks.API.Application.Comands;

public class GetTaskByIdResponse : IResponse
{
    public required TaskDTO Task { get; set; }
}