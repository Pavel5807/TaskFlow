using MediatR;
using TaskFlow.Tasks.API.Application.Models;
using TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate;

namespace TaskFlow.Tasks.API.Application.Comands;

public class GetAllTasksComandHandler : IRequestHandler<GetAllTasksComand, IResponse>
{
    private readonly ITaskRepository _repository;

    public GetAllTasksComandHandler(ITaskRepository repository)
    {
        _repository = repository;
    }

    public async Task<IResponse> Handle(GetAllTasksComand request, CancellationToken cancellationToken)
    {
        var tasks = await _repository.GetAllAsync();

        return new OkObjectResponse<IEnumerable<TaskDTO>>()
        {
            Value = tasks.Select(task => task.ToDTO())
        };
    }
}
