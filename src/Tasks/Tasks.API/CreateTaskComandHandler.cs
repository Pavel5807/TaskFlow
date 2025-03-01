using MediatR;
using TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate;

public class CreateTaskComandHandler : IRequestHandler<CreateTaskComand, bool>
{
    private readonly ITaskRepository _repository;
    public async Task<bool> Handle(CreateTaskComand request, CancellationToken cancellationToken)
    {
        var task = new TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate.Task(request.Id, request.Header);
        foreach (var item in request.Items)
        {
            task.AddItem(item.Description);
        }

        await _repository.AddAsync(task);
        await _repository.SaveAsync();

        return true;
    }
}
