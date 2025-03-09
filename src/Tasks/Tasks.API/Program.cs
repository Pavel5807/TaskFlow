var builder = WebApplication.CreateBuilder(args);

builder.Services.AddAuthentication(builder.Configuration);
builder.Services.AddAuthorization();
builder.Services.AddDbContext(builder.Configuration);
builder.Services.AddMediatR();
builder.Services.AddOpenApi();

var app = builder.Build();

app.UseSwagger();
app.UseSwaggerUI();
app.UseAuthentication();
app.UseAuthorization();
app.MapControllers();

app.Run();
