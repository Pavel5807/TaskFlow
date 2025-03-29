using TaskFlow.Notification.API;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddGrpc();
builder.Services.AddSignalR();

builder.Services.AddDefaultAuthentication(builder.Configuration);
builder.Services.AddAuthorization();

var app = builder.Build();

app.UseAuthentication();
app.UseAuthorization();
app.MapGrpcService<NotificationService>();
app.MapHub<NotificationHub>("/hub");

app.Run();
