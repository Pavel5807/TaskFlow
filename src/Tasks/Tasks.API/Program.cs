var builder = WebApplication.CreateBuilder(args);

builder.Services.AddAuthentication(builder.Configuration);
builder.Services.AddAuthorization();
builder.Services.AddMediatR();
builder.Services.AddOpenApi();

builder.Services.AddDbContext(builder.Configuration);
builder.Services.AddControllers();

var app = builder.Build();

app.UseSwagger();
app.UseSwaggerUI();
app.UseAuthentication();
app.UseAuthorization();
app.MapControllers();

app.Run();
