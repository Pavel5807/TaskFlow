using System;
using MediatR;

namespace TaskFlow.Tasks.API.Application.Comands;

public class GetTaskByIdComand : IRequest<IResponse>
{
    public Guid Id { get; set; }
}
