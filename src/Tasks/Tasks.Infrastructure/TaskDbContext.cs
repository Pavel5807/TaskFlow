using Microsoft.EntityFrameworkCore;

namespace TaskFlow.Tasks.Infrastructure.Repositories;

public class TaskDbContext : DbContext
{
    protected TaskDbContext()
    {
    }
}