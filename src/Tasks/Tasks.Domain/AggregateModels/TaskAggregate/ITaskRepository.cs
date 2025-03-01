namespace TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate;

public interface ITaskRepository
{
    System.Threading.Tasks.Task AddAsync(Task task);
    System.Threading.Tasks.Task SaveAsync();
}