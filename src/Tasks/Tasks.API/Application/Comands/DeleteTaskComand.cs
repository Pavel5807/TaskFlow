using MediatR;

namespace TaskFlow.Tasks.API.Application.Comands;

public class DeleteTaskComand : IRequest<IResponse>
{
    public Guid Id { get; internal set; }
}
