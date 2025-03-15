using System;
using Microsoft.EntityFrameworkCore;
using TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate;
using TaskFlow.Tasks.Infrastructure;
using TaskFlow.Tasks.Infrastructure.Repositories;
using Xunit;

namespace TaskFlow.Tasks.Tests.Infrastucture
{
    public class TaskRepositoryTests : IDisposable
    {
        private readonly TaskDbContext _context;
        private readonly TaskRepository _repository;

        public TaskRepositoryTests()
        {
            var options = new DbContextOptionsBuilder<TaskDbContext>()
                .UseInMemoryDatabase(databaseName: Guid.NewGuid().ToString())
                .Options;

            _context = new TaskDbContext(options);
            _repository = new TaskRepository(_context);
        }

        public void Dispose()
        {
            _context.Database.EnsureDeleted();
            _context.Dispose();
        }

        [Fact]
        public async System.Threading.Tasks.Task AddAsync_WhenTaskAdded_ShouldStoreInDatabase()
        {
            // Arrange
            var taskHeader = "Test Header";
            var task = new Task(taskHeader);

            // Act
            await _repository.AddAsync(task);
            await _repository.SaveAsync();

            // Assert
            var savedTask = await _context.Tasks.FirstOrDefaultAsync(t => t.Id == task.Id);
            Assert.NotNull(savedTask);
            Assert.Equal("Test Header", savedTask.Header);
        }

        [Fact]
        public async System.Threading.Tasks.Task GetByIdAsync_WhenTaskExists_ShouldReturnTaskWithItems()
        {
            // Arrange
            var taskHeader = "Test Header";
            var task = new Task(taskHeader);
            task.AddItem("Item 1");

            await _context.Tasks.AddAsync(task);
            await _context.SaveChangesAsync();

            // Act
            var result = await _repository.GetByIdAsync(task.Id);

            // Assert
            Assert.NotNull(result);
            Assert.Equal(task.Id, result.Id);
            Assert.Single(result.Items);
        }

        [Fact]
        public async System.Threading.Tasks.Task GetByIdAsync_WhenTaskNotExists_ShouldReturnNull()
        {
            // Arrange
            var taskId = Guid.NewGuid();

            // Act
            var result = await _repository.GetByIdAsync(taskId);

            // Assert
            Assert.Null(result);
        }

        [Fact]
        public async System.Threading.Tasks.Task SaveAsync_WhenCalled_ShouldPersistChanges()
        {
            // Arrange
            var taskHeader = "Test Header";
            var task = new Task(taskHeader);
            
            await _repository.AddAsync(task);

            // Act
            await _repository.SaveAsync();

            // Assert
            var savedTask = await _context.Tasks.FirstOrDefaultAsync(t => t.Id == task.Id);
            Assert.NotNull(savedTask);
        }
    }
}