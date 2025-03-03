using System;
using MediatR;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

var builder = WebApplication.CreateBuilder(args);

var app = builder.Build();

var tasksApi = app.MapGroup("/api/tasks");
tasksApi.MapPost("/", CreateTask);
tasksApi.MapGet("/", GetAllTasks);
tasksApi.MapGet("/{id}", ReadTaskById);
tasksApi.MapPut("/{id}", UpdateTaskById);
tasksApi.MapDelete("/{id}", DeleteTaskById);

app.Run();

async System.Threading.Tasks.Task<IResult> CreateTask([FromBody] CreateTaskComand request, [FromServices] Mediator mediator)
{
    throw new NotImplementedException();
}

async System.Threading.Tasks.Task<IResult> GetAllTasks([FromServices] Mediator mediator)
{
    throw new NotImplementedException();
}

async System.Threading.Tasks.Task<IResult> ReadTaskById(Guid id)
{
    throw new NotImplementedException();
}

async System.Threading.Tasks.Task<IResult> UpdateTaskById(Guid id)
{
    throw new NotImplementedException();
}

async System.Threading.Tasks.Task<IResult> DeleteTaskById(Guid id)
{
    throw new NotImplementedException();
}
