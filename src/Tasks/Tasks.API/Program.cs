var builder = WebApplication.CreateBuilder(args);

builder.Services.AddDefaultAuthentication(builder.Configuration);
builder.Services.AddAuthorization();
builder.Services.AddDefaultOpenApi(builder.Configuration);

builder.Services.AddMediatR();
builder.Services.AddDbContext(builder.Configuration);
builder.Services.AddControllers();

var app = builder.Build();

app.UseOpenApi(builder.Configuration);
app.UseAuthentication();
app.UseAuthorization();
app.MapControllers();

app.Run();
