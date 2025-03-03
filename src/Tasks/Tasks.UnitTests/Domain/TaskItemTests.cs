using TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate;

namespace TaskFlow.Tasks.Tests.Domain;

public class TaskItemTests
{
    [Fact]
    public void Constructor_ShouldInitializeCorrectly()
    {
        // Arrange
        var description = "Test item";

        // Act
        var item = new TaskItem(description);

        // Assert
        Assert.False(item.IsCompleted);
        Assert.Equal("Test item", item.Description);
    }

    [Fact]
    public void Complete_ShouldSetIsCompletedToTrue()
    {
        // Arrange
        var description = "Test item";
        var item = new TaskItem(description);

        // Act
        item.Complete();

        // Assert
        Assert.True(item.IsCompleted);
    }

    [Fact]
    public void UpdateDescription_ShouldChangeDescription()
    {
        // Arrange
        var description = "Old description";
        var item = new TaskItem(description);

        // Act
        item.UpdateDescription("New description");

        // Assert
        Assert.Equal("New description", item.Description);
    }
}
