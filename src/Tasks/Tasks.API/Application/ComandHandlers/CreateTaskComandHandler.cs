using MediatR;
using TaskFlow.Tasks.API.Application.Models;
using TaskAggregate = TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate;

namespace TaskFlow.Tasks.API.Application.Comands;

public class CreateTaskComandHandler : IRequestHandler<CreateTaskComand, IResponse>
{
    private readonly TaskAggregate.ITaskRepository _repository;

    public CreateTaskComandHandler(TaskAggregate.ITaskRepository repository)
    {
        _repository = repository;
    }

    public async Task<IResponse> Handle(CreateTaskComand request, CancellationToken cancellationToken)
    {
        var task = new TaskAggregate.Task(request.Header);

        foreach (var item in request.Items ?? [])
        {
            task.AddItem(item.Description);
        }

        await _repository.AddAsync(task);
        await _repository.SaveAsync();

        return new OkObjectResponse<TaskDTO>()
        {
            Value = task.ToDTO()
        };
    }
}
