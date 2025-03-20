using System.Security.Claims;
using System.Text.Json;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using TaskFlow.Tasks.Infrastructure;
using TaskFlow.Tasks.Infrastructure.Repositories;

public static class CommonExtensions
{
    public static IServiceCollection AddDefaultAuthentication(this IServiceCollection services, IConfiguration configuration)
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

        authenticationBuilder.AddJwtBearer(JwtBearerDefaults.AuthenticationScheme, options =>
        {
            var authority = identitySection.GetValue<string>("Authority") ?? throw new Exception();
            var audience = identitySection.GetValue<string>("Audience") ?? throw new Exception();
            var issuers = identitySection.GetSection("ValidIssuers").Get<string[]>() ?? [];

            options.Authority = authority;
            options.Audience = audience;
            options.RequireHttpsMetadata = false;
            options.TokenValidationParameters = new TokenValidationParameters()
            {
                ValidateIssuer = true,
                ValidateAudience = true,
                ValidateLifetime = true,
                ValidIssuers = issuers
            };

            options.Events = new JwtBearerEvents()
            {
                OnTokenValidated = context =>
                {
                    if (context.Principal?.Identity is not ClaimsIdentity identity)
                    {
                        return Task.CompletedTask;
                    }

                    var resourceAccess = context.Principal.FindFirst("resource_access")?.Value;
                    if (string.IsNullOrEmpty(resourceAccess))
                    {
                        return Task.CompletedTask;
                    }

                    var resourceAccessObj = JsonDocument.Parse(resourceAccess);
                    if (resourceAccessObj.RootElement.TryGetProperty("tasks-api", out var tasksApi) is false)
                    {
                        return Task.CompletedTask;
                    }

                    var roles = tasksApi.GetProperty("roles").EnumerateArray();
                    foreach (var role in roles)
                    {
                        identity.AddClaim(new Claim(ClaimTypes.Role, role.GetString()!));
                    }
                    return Task.CompletedTask;
                }
            };
        });

        return services;
    }

    public static IServiceCollection AddDbContext(this IServiceCollection services, IConfiguration configuration)
    {
        var connectionString = configuration.GetConnectionString("TasksDB") ?? throw new Exception();

        services.AddDbContext<TaskDbContext>(options => options.UseNpgsql(connectionString));

        services.AddScoped<TaskFlow.Tasks.Domain.AggregateModels.TaskAggregate.ITaskRepository, TaskRepository>();

        return services;
    }

    public static IServiceCollection AddDefaultMediatR(this IServiceCollection services)
    {
        services.AddMediatR(config => config.RegisterServicesFromAssembly(typeof(Program).Assembly));

        return services;
    }

    public static IServiceCollection AddDefaultOpenApi(this IServiceCollection services, IConfiguration configuration)
    {
        // "OpenApi": {
        //   "Document": {
        //     "Title": "...",
        //     "Description": "...",
        //     "Version": "..."
        //   }
        // }

        // "Identity": {
        //   "Authority": "...",
        //   "Scopes": {
        //     "...": "..."
        //   }
        // }

        var openApiSection = configuration.GetSection("OpenApi");

        if (openApiSection.Exists() is false)
        {
            return services;
        }

        services.AddEndpointsApiExplorer();

        services.AddSwaggerGen(options =>
        {
            var document = openApiSection.GetRequiredSection("Document");

            var version = document.GetValue<string>("Version");
            var title = document.GetValue<string>("Title");
            var description = document.GetValue("Description", "");

            options.SwaggerDoc(version, new OpenApiInfo
            {
                Title = title,
                Version = version,
                Description = description
            });


            var authSection = openApiSection.GetSection("Auth");
            if (authSection.Exists() is false)
            {
                return;
            }

            var authority = authSection.GetValue<string>("Authority");
            var scopeDefinitions = authSection.GetRequiredSection("Scopes").GetChildren();

            var authorizationUrl = new Uri($"{authority}/protocol/openid-connect/auth");
            var tokenUrl = new Uri($"{authority}/protocol/openid-connect/token");
            var definedScopes = scopeDefinitions.ToDictionary(section => section.Key, section => section.Value);

            var securityScheme = new OpenApiSecurityScheme()
            {
                Type = SecuritySchemeType.OAuth2,
                Flows = new OpenApiOAuthFlows()
                {
                    AuthorizationCode = new OpenApiOAuthFlow()
                    {
                        AuthorizationUrl = authorizationUrl,
                        TokenUrl = tokenUrl,
                        Scopes = definedScopes
                    }
                }
            };

            options.AddSecurityDefinition("oauth2", securityScheme);


            var schemeReference = new OpenApiSecurityScheme()
            {
                Reference = new OpenApiReference()
                {
                    Id = "oauth2",
                    Type = ReferenceType.SecurityScheme
                }
            };

            var requiredScopes = scopeDefinitions
                .Select(section => section.Key).ToList();

            var securityRequirement = new OpenApiSecurityRequirement
            {
                { schemeReference, requiredScopes }
            };

            options.AddSecurityRequirement(securityRequirement);
        });

        return services;
    }

    public static WebApplication UseOpenApi(this WebApplication app, IConfiguration configuration)
    {
        // "OpenApi": {
        //   "Endpoint: {
        //     "Name": 
        //   },
        //   "Auth": {
        //     "ClientId": ..,
        //     "AppName": ..
        //   }
        // }

        var openApiSection = configuration.GetSection("OpenApi");

        if (openApiSection.Exists() is false)
        {
            return app;
        }

        app.UseSwagger();
        app.UseSwaggerUI(options =>
        {
            var endpointSection = openApiSection.GetRequiredSection("endpoint");
            var name = endpointSection.GetValue<string>("Name");

            options.SwaggerEndpoint("/swagger/v1/swagger.json", name);

            var authSection = openApiSection.GetSection("Auth");
            if (authSection.Exists() is false)
            {
                return;
            }

            var clientId = authSection.GetValue<string>("ClientId");
            var clientSecret = authSection.GetValue<string>("ClientSecret");
            options.OAuthClientId(clientId);
            options.OAuthClientSecret(clientSecret);
            options.OAuthUsePkce();
        });

        app.MapGet("/", () => Results.Redirect("/swagger")).ExcludeFromDescription();

        return app;
    }
}
