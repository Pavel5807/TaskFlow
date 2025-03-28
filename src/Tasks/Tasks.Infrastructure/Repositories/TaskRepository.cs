using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate;

namespace TaskFlow.Tasks.Infrastructure.Repositories;

public class TaskRepository : ITaskRepository
{
    private readonly TaskDbContext _context;

    public TaskRepository(TaskDbContext context)
    {
        _context = context;
    }

    public async System.Threading.Tasks.Task AddAsync(Task task)
    {
        await _context.Tasks.AddAsync(task);
    }

    public void Delete(Task task)
    {
        _context.Remove(task);
    }

    public async System.Threading.Tasks.Task<IEnumerable<Task>> GetAllAsync()
    {
        return await _context.Tasks.Include(task => task.History)
            .Include(task => task.Items).ToListAsync();
    }

    public async System.Threading.Tasks.Task<Task?> GetByIdAsync(Guid id)
    {
        var task = await _context.Tasks.FirstOrDefaultAsync(task => task.Id == id);
        if (task is null)
        {
            return task;
        }

        await _context.Entry(task).Collection(task => task.Items).LoadAsync();

        return task;
    }

    public async System.Threading.Tasks.Task SaveAsync()
    {
        await _context.SaveChangesAsync();
    }
}
