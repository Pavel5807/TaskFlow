namespace TaskFlow.Tasks.API.Application.Models;

public class TaskDTO
{
    public Guid Id { get; set; }
    public AssigneeInfoDTO? Assignee { get; set; }
    public required string Header { get; set; }
    public required IEnumerable<TaskItemDTO> Items { get; set; }
    public required IEnumerable<TaskHistoryDTO> History { get; set; }
}