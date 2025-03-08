using MediatR;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TaskFlow.Tasks.API.Application.Comands;
using TaskFlow.Tasks.API.Application.Models;
using TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate;
using TaskFlow.Tasks.Infrastructure;
using TaskFlow.Tasks.Infrastructure.Repositories;


var builder = WebApplication.CreateBuilder(args);

builder.Services.AddDbContext<TaskDbContext>(config => config.UseNpgsql("Host=localhost;Port=5432;Database=TasksDb;Username=admin;Password=123", b => b.MigrationsAssembly("Tasks.Infrastructure")));
builder.Services.AddScoped<ITaskRepository, TaskRepository>();
builder.Services.AddMediatR(config => config.RegisterServicesFromAssembly(typeof(Program).Assembly));
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

app.UseSwagger();
app.UseSwaggerUI();

var tasksApi = app.MapGroup("/api/tasks");
tasksApi.MapPost("/", CreateTask);
tasksApi.MapGet("/", GetAllTasks);
tasksApi.MapGet("/{id}", GetTaskById);
tasksApi.MapPut("/{id}", UpdateTaskById);
tasksApi.MapDelete("/{id}", DeleteTaskById);

app.Run();

async Task<IResult> CreateTask([FromBody] CreateTaskComand comand, [FromServices] IMediator mediator)
{
    var result = await mediator.Send(comand);

    return result.ToResult();
}

async Task<IResult> GetAllTasks([FromServices] IMediator mediator)
{
    var comand = new GetAllTasksComand();

    var result = await mediator.Send(comand);

    return result.ToResult();
}

async Task<IResult> GetTaskById(Guid id, IMediator mediator)
{
    var comand = new GetTaskByIdComand()
    {
        Id = id
    };

    var result = await mediator.Send(comand);

    return result.ToResult();
}

async Task<IResult> UpdateTaskById(UpdateTaskComand comand, IMediator mediator)
{
    var result = await mediator.Send(comand);

    return result.ToResult();
}

async Task<IResult> DeleteTaskById(Guid id, IMediator mediator)
{
    var comand = new DeleteTaskComand()
    {
        Id = id
    };

    var result = await mediator.Send(comand);

    return result.ToResult();
}
