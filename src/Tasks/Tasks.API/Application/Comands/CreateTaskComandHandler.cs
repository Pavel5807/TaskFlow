using System.Threading;
using MediatR;
using TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate;

namespace TaskFlow.Tasks.API.Application.Comands;

public class CreateTaskComandHandler : IRequestHandler<CreateTaskComand, bool>
{
    private readonly ITaskRepository _repository;

    public CreateTaskComandHandler(ITaskRepository repository)
    {
        _repository = repository;
    }

    public async System.Threading.Tasks.Task<bool> Handle(CreateTaskComand request, CancellationToken cancellationToken)
    {
        var task = new Task(request.Id, request.Header);

        foreach (var item in request.Items)
        {
            task.AddItem(item.Description);
        }

        await _repository.AddAsync(task);
        await _repository.SaveAsync();

        return true;
    }
}
