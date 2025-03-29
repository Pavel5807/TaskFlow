using Microsoft.AspNetCore.SignalR;

namespace TaskFlow.Notification.API.Hubs;

public class NotificationHub : Hub
{
    public async Task JoinGroup(string userId)
    {
        await Groups.AddToGroupAsync(Context.ConnectionId, userId);
    }
}
