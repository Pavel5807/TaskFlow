using System;
using System.Threading;
using MediatR;
using TaskFlow.Tasks.API.Application.Models;

namespace TaskFlow.Tasks.API.Application.Comands;

public class UpdateTaskComand : IRequest<UpdateTaskResponse>
{
    public Guid Id { get; internal set; }
    public string Header { get; internal set; }
    public IEnumerable<TaskItemDTO> Items { get; set; }
}
