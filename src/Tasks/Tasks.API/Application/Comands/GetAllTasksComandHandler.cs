using System.Linq;
using System.Threading;
using MediatR;
using TaskFlow.Tasks.API.Application.Models;
using TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate;

namespace TaskFlow.Tasks.API.Application.Comands;

public class GetAllTasksComandHandler : IRequestHandler<GetAllTasksComand, GetAllTasksResponse>
{
    private readonly ITaskRepository _repository;

    public GetAllTasksComandHandler(ITaskRepository repository)
    {
        _repository = repository;
    }

    public async System.Threading.Tasks.Task<GetAllTasksResponse> Handle(GetAllTasksComand request, CancellationToken cancellationToken)
    {
        var tasks = await _repository.GetAllAsync();

        return new GetAllTasksResponse()
        {
            Tasks = tasks.Select(task => task.ToDTO())
        };
    }
}
