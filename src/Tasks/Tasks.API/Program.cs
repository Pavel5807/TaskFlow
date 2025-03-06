using System;
using MediatR;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using TaskFlow.Tasks.API.Application.Comands;
using TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate;
using TaskFlow.Tasks.Infrastructure.Repositories;


var builder = WebApplication.CreateBuilder(args);



var app = builder.Build();

var tasksApi = app.MapGroup("/api/tasks");
tasksApi.MapPost("/", CreateTask);
tasksApi.MapGet("/", GetAllTasks);
tasksApi.MapGet("/{id}", GetTaskById);
tasksApi.MapPut("/{id}", UpdateTaskById);
tasksApi.MapDelete("/{id}", DeleteTaskById);

app.Run();

async System.Threading.Tasks.Task<IResult> CreateTask([FromBody] CreateTaskComand comand, [FromServices] IMediator mediator)
{
    await mediator.Send(comand);

    return TypedResults.Ok();
}

async System.Threading.Tasks.Task<IResult> GetAllTasks([FromServices] IMediator mediator)
{
    var comand = new GetAllTasksComand();

    var result = await mediator.Send(comand);

    return TypedResults.Ok();
}

System.Threading.Tasks.Task<IResult> GetTaskById(Guid id)
{
    throw new NotImplementedException();
}

System.Threading.Tasks.Task<IResult> UpdateTaskById(Guid id)
{
    throw new NotImplementedException();
}

System.Threading.Tasks.Task<IResult> DeleteTaskById(Guid id)
{
    throw new NotImplementedException();
}
