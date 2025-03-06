using System.Collections.Generic;
using TaskFlow.Tasks.API.Application.Models;

namespace TaskFlow.Tasks.API.Application.Comands;

public class GetAllTasksResponse : IResponse
{
    public required IEnumerable<TaskDTO> Tasks { get; set; }
}
