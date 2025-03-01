using MediatR;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate;

var builder = WebApplication.CreateBuilder(args);


var app = builder.Build();

var tasksApi = app.MapGroup("/api/tasks");
tasksApi.MapPost("/", CreateTask);
tasksApi.MapGet("/", ReadAllTasks);
tasksApi.MapGet("/{id}", ReadTaskById);
tasksApi.MapPut("/{id}", UpdateTaskById);
tasksApi.MapDelete("/{id}", DeleteTaskById);

app.Run();

async Task<IResult> CreateTask([FromBody] CreateTaskComand request, [FromServices] Mediator mediator)
{
    var result = await mediator.Send(request);
    if (result is false)
    {
        return TypedResults.BadRequest();
    }

    return TypedResults.Created();
}

async Task<IResult> ReadAllTasks()
{
    throw new NotImplementedException();
}

async Task<IResult> ReadTaskById(Guid id)
{
    throw new NotImplementedException();
}

async Task<IResult> UpdateTaskById(Guid id)
{
    throw new NotImplementedException();
}

async Task<IResult> DeleteTaskById(Guid id)
{
    throw new NotImplementedException();
}

public class Repository : ITaskRepository
{
    private readonly ApplicationDbContext _context;

    public Repository(ApplicationDbContext context)
    {
        _context = context;
    }

    public async System.Threading.Tasks.Task AddAsync(TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate.Task task)
    {
        await _context.AddAsync(task);
    }

    public async System.Threading.Tasks.Task SaveAsync()
    {
        await _context.SaveChangesAsync();
    }
}

public class ApplicationDbContext : DbContext
{
    public DbSet<TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate.Task> Tasks { get; set; }
    public DbSet<TaskHistory> TaskHistories { get; set; }
    public DbSet<TaskItem> TaskItems { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        base.OnConfiguring(optionsBuilder);
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate.Task>(
            entity =>
            {
                entity.HasKey(task => task.Id);
                entity.HasMany(task => task.Items).WithOne(item => item.TaskId);
                entity.HasMany(task => task.History).WithOne(history => history.TaskId);
            }
        );

        modelBuilder.Entity<TaskItem>(
            entity =>
            {
                entity.HasKey(item => item.Id);
            }
        );
    }
}