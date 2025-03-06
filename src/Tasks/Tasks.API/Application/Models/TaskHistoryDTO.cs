namespace TaskFlow.Tasks.API.Application.Models;

public record TaskHistoryDTO
{
    public required string Action { get; set; }
}