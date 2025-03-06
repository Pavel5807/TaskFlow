using System.Threading;
using MediatR;
using TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate;

namespace TaskFlow.Tasks.API.Application.Comands;

public class DeleteTaskComandHandler : IRequestHandler<DeleteTaskComand, IResponse>
{
    private readonly ITaskRepository _repository;

    public DeleteTaskComandHandler(ITaskRepository repository)
    {
        _repository = repository;
    }

    public async System.Threading.Tasks.Task<IResponse> Handle(DeleteTaskComand request, CancellationToken cancellationToken)
    {
        var task = await _repository.GetByIdAsync(request.Id);
        if (task is null)
        {
            return new NotFoundResponse();
        }

        _repository.Delete(task);
        await _repository.SaveAsync();

        return new DeleteTaskResponse();
    }
}
