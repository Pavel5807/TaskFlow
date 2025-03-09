using MediatR;
using Microsoft.AspNetCore.Mvc;
using TaskFlow.Tasks.API.Application.Comands;

namespace TaskFlow.Tasks.API.Controllers;

[ApiController]
[Route("api/v1/[Controller]")]
public class TasksController : ControllerBase
{
    private readonly IMediator _mediator;

    public TasksController(IMediator mediator)
    {
        _mediator = mediator;
    }

    [HttpPost]
    public async Task<IResult> CreateTask(CreateTaskComand comand)
    {
        var result = await _mediator.Send(comand);

        return result.ToResult();
    }

    [HttpGet]
    public async Task<IResult> GetAllTasks()
    {
        var comand = new GetAllTasksComand();

        var result = await _mediator.Send(comand);

        return result.ToResult();
    }

    [HttpGet("/{id}")]
    public async Task<IResult> GetTaskById(Guid id)
    {
        var comand = new GetTaskByIdComand()
        {
            Id = id
        };

        var result = await _mediator.Send(comand);

        return result.ToResult();
    }

    [HttpPut]
    public async Task<IResult> UpdateTaskById(UpdateTaskComand comand)
    {
        var result = await _mediator.Send(comand);

        return result.ToResult();
    }

    [HttpDelete("/{id}")]
    public async Task<IResult> DeleteTaskById(Guid id)
    {
        var comand = new DeleteTaskComand()
        {
            Id = id
        };

        var result = await _mediator.Send(comand);

        return result.ToResult();
    }
}
