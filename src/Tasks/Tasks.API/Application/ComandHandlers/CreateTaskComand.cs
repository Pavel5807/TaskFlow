using System;
using System.Collections.Generic;
using MediatR;
using TaskFlow.Tasks.API.Application.Models;

namespace TaskFlow.Tasks.API.Application.Comands;

public class CreateTaskComand : IRequest<bool>
{
    public Guid Id { get; set; }
    public string Header { get; set; }
    public IEnumerable<TaskItemDTO> Items { get; set; }
}
