using Microsoft.EntityFrameworkCore;
using TaskFlow.Tasks.API.Application.Models;
using TaskFlow.Tasks.Infrastructure;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddDefaultAuthentication(builder.Configuration);
builder.Services.AddAuthorization();

builder.Services
    .AddGraphQLServer()
    .AddQueryType<Query>()
    .AddFiltering();

builder.Services.AddDefaultOpenApi(builder.Configuration);

builder.Services.AddDefaultMediatR();
builder.Services.AddDbContext(builder.Configuration);
builder.Services.AddControllers();

var app = builder.Build();

app.UseOpenApi(builder.Configuration);
app.UseAuthentication();
app.UseAuthorization();
app.MapGraphQL();
app.MapControllers();

app.Run();

public class Query
{
    [UseFiltering]
    public IQueryable<TaskDTO> GetTasks(TaskDbContext context) 
    {
        return context.Tasks
            .Include(task => task.History)
            .Include(task => task.Items)
            .Select(task => task.ToDTO());
    }
}
