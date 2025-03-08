using System.Threading;
using MediatR;
using TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate;

namespace TaskFlow.Tasks.API.Application.Comands;

public class UpdateTaskComandHandler : IRequestHandler<UpdateTaskComand, IResponse>
{
    private readonly ITaskRepository _repository;

    public UpdateTaskComandHandler(ITaskRepository repository)
    {
        _repository = repository;
    }

    public async Task<IResponse> Handle(UpdateTaskComand request, CancellationToken cancellationToken)
    {
        var task = await _repository.GetByIdAsync(request.Id);
        if (task is null)
        {
            return new NotFoundResponse();
        }

        if (request.Header is not null)
        {
            task.EditHeader(request.Header);
        }

        foreach (var item in request.Items ?? [])
        {
            task.EditItem(item.Id, item.Description);
        }

        return new OkResponse();                       
    }
}
