using System.Threading;
using MediatR;
using TaskFlow.Tasks.API.Application.Models;
using TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate;

namespace TaskFlow.Tasks.API.Application.Comands;

public class GetTaskByIdComandHandler : IRequestHandler<GetTaskByIdComand, IResponse>
{
    private readonly ITaskRepository _repository;

    public GetTaskByIdComandHandler(ITaskRepository repository)
    {
        _repository = repository;
    }

    public async Task<IResponse> Handle(GetTaskByIdComand request, CancellationToken cancellationToken)
    {
        var task = await _repository.GetByIdAsync(request.Id);
        if (task is null)
        {
            return new NotFoundResponse();
        }

        return new OkObjectResponse<TaskDTO>()
        {
            Value = task.ToDTO()
        };
    }
}
