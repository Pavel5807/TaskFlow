using TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate;
using Xunit;

namespace TaskFlow.Tasks.Tests.Domain;

public class AssigneeInfoTests
{
    [Fact]
    public void Constructor_ShouldSetProperties()
    {
        // Arrange & Act
        var assignee = new AssigneeInfo("testuser", "test@example.com");

        // Assert
        Assert.Equal("test@example.com", assignee.Email);
        Assert.Equal("testuser", assignee.Username);
    }
}