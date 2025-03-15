using System;
using System.Linq;
using TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate;

namespace TaskFlow.Tasks.Tests.Domain;

public class TaskTests
{
    [Fact]
    public void Constructor_ShouldInitializeCorrectly()
    {
        // Arrange & Act
        var taskHeader = "Test task";
        var task = new Task(taskHeader);

        // Assert
        Assert.Equal("Test task", task.Header);
        Assert.Empty(task.Items);
        Assert.Empty(task.History);
    }

    [Fact]
    public void AddItem_ShouldAddNewTaskItemAndHistory()
    {
        // Arrange
        var taskHeader = "Test task";
        var task = new Task(taskHeader);

        // Act
        task.AddItem("New item");

        // Assert
        Assert.Single(task.Items);
        Assert.Equal("New item", task.Items.First().Description);
        Assert.Contains(task.History, h => h.Action == "Item was added");
    }

    [Fact]
    public void EditItem_ShouldUpdateDescriptionAndAddHistory()
    {
        // Arrange
        var taskHeader = "Test task";
        var task = new Task(taskHeader);
        task.AddItem("Initial description");

        // Act
        task.EditItem(task.Items.ElementAt(0).Id, "Updated description");

        // Assert
        Assert.Equal("Updated description", task.Items.First().Description);
        Assert.Contains(task.History, h => h.Action == "Item was changed");
    }

    [Fact]
    public void EditItem_InvalidIndex_ShouldThrowException()
    {
        // Arrange
        var taskHeader = "Test task";
        var task = new Task(taskHeader);

        // Act & Assert
        Assert.Throws<Exception>(() => task.EditItem(Guid.NewGuid(), "Invalid"));
    }

    [Fact]
    public void RemoveItem_ShouldRemoveItemAndAddHistory()
    {
        // Arrange
        var taskHeader = "Test task";
        var task = new Task(taskHeader);
        task.AddItem("To be removed");

        // Act
        task.RemoveItem(0);

        // Assert
        Assert.Empty(task.Items);
        Assert.Contains(task.History, h => h.Action == "Item was deleted");
    }

    [Fact]
    public void CompleteItem_ShouldMarkAsCompletedAndAddHistory()
    {
        // Arrange
        var taskId = Guid.NewGuid();
        var taskHeader = "Test task";
        var task = new Task(taskHeader);
        task.AddItem("Task item");

        // Act
        task.CompleteItem(0);

        // Assert
        Assert.True(task.Items.First().IsCompleted);
        Assert.Contains(task.History, h => h.Action == "Item was closed");
    }

    [Fact]
    public void History_ShouldTrackAllBasicOperationsInOrder()
    {
        // Arrange
        var taskId = Guid.NewGuid();
        var taskHeader = "Task with history";
        var task = new Task(taskHeader);

        // Act & Assert
        // 1. Добавление элемента
        task.AddItem("First item");
        Assert.Single(task.History);
        Assert.Equal("Item was added", task.History.Last().Action);

        // 2. Изменение элемента
        task.EditItem(task.Items.ElementAt(0).Id, "Updated item");
        Assert.Equal(2, task.History.Count());
        Assert.Equal("Item was changed", task.History.Last().Action);

        // 3. Удаление элемента
        task.RemoveItem(0);
        Assert.Equal(3, task.History.Count());
        Assert.Equal("Item was deleted", task.History.Last().Action);

        // Проверка порядка записей
        var historyActions = task.History.Select(h => h.Action).ToArray();
        Assert.Equal(new[]
        {
            "Item was added",
            "Item was changed",
            "Item was deleted"
        }, historyActions);
    }

    [Fact]
    public void History_ShouldNotRecordFailedOperations()
    {
        // Arrange
        var taskId = Guid.NewGuid();
        var taskHeader = "Empty task";
        var task = new Task(taskHeader);

        // Act & Assert
        // Попытка редактирования несуществующего элемента
        Assert.Throws<Exception>(() => task.EditItem(Guid.NewGuid(), "Invalid"));
        Assert.Empty(task.History);

        // Попытка удаления несуществующего элемента
        Assert.Throws<Exception>(() => task.RemoveItem(99));
        Assert.Empty(task.History);
    }

    [Fact]
    public void History_ShouldIncrementallyGrow()
    {
        // Arrange
        var taskId = Guid.NewGuid();
        var taskHeader = "Task History growth";
        var task = new Task(taskHeader);
        var initialHistoryCount = task.History.Count();

        // Act & Assert
        task.AddItem("Test Item");
        Assert.Equal(initialHistoryCount + 1, task.History.Count());

        task.CompleteItem(0);
        Assert.Equal(initialHistoryCount + 2, task.History.Count());
    }
}
