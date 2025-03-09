using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication.OpenIdConnect;
using Microsoft.EntityFrameworkCore;
using TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate;
using TaskFlow.Tasks.Infrastructure;
using TaskFlow.Tasks.Infrastructure.Repositories;

public static class CommonExtensions
{
    public static IServiceCollection AddAuthentication(this IServiceCollection services, IConfiguration configuration)
    {
        // "Identity": {
        //   "Authority": "...",
        //   "ClientId": "...",
        //   "ClientSecret": "...",
        //   "ResponseType": "...",
        //   "CallbackPath": "/signin-oidc"
        // }

        var identitySection = configuration.GetSection("Identity");

        if (identitySection.Exists() is false)
        {
            return services;
        }

        var authenticationBuilder = services.AddAuthentication(options =>
        {
            options.DefaultScheme = CookieAuthenticationDefaults.AuthenticationScheme;
            options.DefaultChallengeScheme = OpenIdConnectDefaults.AuthenticationScheme;
        });

        authenticationBuilder.AddCookie(CookieAuthenticationDefaults.AuthenticationScheme);

        var authority = identitySection.GetValue<string>("Authority") ?? throw new Exception();
        var clientId = identitySection.GetValue<string>("ClientId") ?? throw new Exception();
        var clientSecret = identitySection.GetValue<string>("ClientSecret") ?? throw new Exception();
        var responseType = identitySection.GetValue<string>("ResponseType") ?? throw new Exception();
        var callbackPath = identitySection.GetValue<string>("CallbackPath") ?? throw new Exception();

        authenticationBuilder.AddOpenIdConnect(OpenIdConnectDefaults.AuthenticationScheme, options =>
        {
            options.Authority = authority;
            options.ClientId = clientId;
            options.ClientSecret = clientSecret;
            options.ResponseType = responseType;
            options.CallbackPath = callbackPath;

            options.SaveTokens = true;

            options.RequireHttpsMetadata = false;

            options.Scope.Add("openid");
            options.Scope.Add("profile");
            options.Scope.Add("email");
        });

        return services;
    }

    public static IServiceCollection AddDbContext(this IServiceCollection services, IConfiguration configuration)
    {
        var connectionString = configuration.GetConnectionString("TasksDB") ?? throw new Exception();

        services.AddDbContext<TaskDbContext>(options => options.UseNpgsql(connectionString));

        services.AddScoped<ITaskRepository, TaskRepository>();

        return services;
    }

    public static IServiceCollection AddMediatR(this IServiceCollection services)
    {
        services.AddMediatR(config => config.RegisterServicesFromAssembly(typeof(Program).Assembly));

        return services;
    }

    public static IServiceCollection AddOpenApi(this IServiceCollection services)
    {
        services.AddEndpointsApiExplorer();
        
        services.AddSwaggerGen();

        return services;
    }
}
