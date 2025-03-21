using TaskFlow.Tasks.Domain.Seedwork;

namespace TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate;

public class AssigneeInfo : ValueObject
{
    private string _email;
    private string _username;

    public AssigneeInfo(string username, string email)
    {
        _email = email;
        _username = username;
    }

    public string Email { get => _email; private set => _email = value; }
    public string Username { get => _username; private set => _username = value; }
}