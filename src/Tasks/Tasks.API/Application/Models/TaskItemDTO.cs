using System;

namespace TaskFlow.Tasks.API.Application.Models;

public record TaskItemDTO
{
    public required string Description { get; set; }
    public Guid Id { get; set; }
}
