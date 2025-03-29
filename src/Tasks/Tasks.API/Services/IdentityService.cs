using System.Security.Claims;

namespace TaskFlow.Tasks.API.Services;

public class IdentityService : IIdentityService
{
    private IHttpContextAccessor _context;

    public IdentityService(IHttpContextAccessor context)
    {
        _context = context ?? throw new ArgumentNullException(nameof(context));
    }

    public Guid GetUserIdentity()
    {
        var sub = _context.HttpContext?.User.FindFirst(ClaimTypes.NameIdentifier)?.Value;

        if (string.IsNullOrEmpty(sub))
        {
            return Guid.Empty;
        }

        if (Guid.TryParse(sub, out var userId) is false)
        {
            return Guid.Empty;
        }

        return userId;
    }
}
