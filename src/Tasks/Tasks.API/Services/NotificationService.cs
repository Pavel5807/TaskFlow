using NotificationApi;

namespace TaskFlow.Tasks.API.Services;

public class NotificationService
{
    private readonly Notification.NotificationClient _client;

    public NotificationService(Notification.NotificationClient client)
    {
        _client = client;
    }

    public async Task SendNotification(Guid userId, string message)
    {
        var request = new NotificationRequest()
        {
            Message = message,
            UserId = userId.ToString()
        };

        await _client.SendNotificationAsync(request);
    }
}