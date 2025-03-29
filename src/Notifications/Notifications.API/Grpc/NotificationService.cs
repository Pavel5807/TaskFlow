using Grpc.Core;
using Microsoft.AspNetCore.SignalR;
using NotificationApi;
using TaskFlow.Notification.API.Hubs;
using static NotificationApi.Notification;

namespace TaskFlow.Notification.API;

public class NotificationService : NotificationBase
{
    private readonly IHubContext<NotificationHub> _hubContext;

    public NotificationService(IHubContext<NotificationHub> hubContext)
    {
        _hubContext = hubContext;
    }

    public override async Task<NotificationResponse> SendNotification(
        NotificationRequest request,
        ServerCallContext context)
    {
        await _hubContext.Clients.User(request.UserId).SendAsync("ReceiveNotification", request.Message);
        
        return new NotificationResponse { Success = true };
    }
}