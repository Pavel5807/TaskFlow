using TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate;
using Xunit;

namespace TaskFlow.Tasks.Tests.Domain;

public class TaskHistoryTests
{
    [Fact]
    public void Constructor_ShouldSetActionCorrectly()
    {
        // Arrange
        var action = "Test action";

        // Act
        var history = new TaskHistory(action);

        // Assert
        Assert.Equal("Test action", history.Action);
    }
}