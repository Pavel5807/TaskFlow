using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate;
using TaskFlow.Tasks.Infrastructure;
using TaskFlow.Tasks.Infrastructure.Repositories;

public static class CommonExtensions
{
    public static IServiceCollection AddAuthentication(this IServiceCollection services, IConfiguration configuration)
    {
        // NOTE: backend
        // "Identity": {
        //   "Audience": "...",
        //   "Authority": "..."
        // }

        // NOTE: frontend
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
            options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
        });

        var authority = identitySection.GetValue<string>("Authority") ?? throw new Exception();
        var audience = identitySection.GetValue<string>("Audience") ?? throw new Exception();

        authenticationBuilder.AddJwtBearer(JwtBearerDefaults.AuthenticationScheme, options =>
        {
            options.Authority = authority;
            options.Audience = audience;
            options.RequireHttpsMetadata = false;
            options.TokenValidationParameters = new TokenValidationParameters()
            {
                ValidateIssuer = true,
                ValidateAudience = true,
                ValidateLifetime = true
            };
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
