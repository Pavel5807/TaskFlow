using Microsoft.OpenApi.Models;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddAuthentication(builder.Configuration);
builder.Services.AddAuthorization();
builder.Services.AddMediatR();

builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo { Title = "Tasks API", Version = "v1" });
    
    c.AddSecurityDefinition("oauth2", new OpenApiSecurityScheme
    {
        Type = SecuritySchemeType.OAuth2,
        Flows = new OpenApiOAuthFlows
        {
            AuthorizationCode = new OpenApiOAuthFlow
            {
                AuthorizationUrl = new Uri("http://localhost/realms/task-flow/protocol/openid-connect/auth"),
                TokenUrl = new Uri("http://localhost/realms/task-flow/protocol/openid-connect/token"),
                Scopes = new Dictionary<string, string>
                {
                    { "openid", "OpenID" },
                    { "profile", "Profile" }
                }
            }
        }
    });

    c.AddSecurityRequirement(new OpenApiSecurityRequirement
    {
        {
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference { Type = ReferenceType.SecurityScheme, Id = "oauth2" }
            },
            new[] { "openid", "profile" }
        }
    });
});

builder.Services.AddDbContext(builder.Configuration);
builder.Services.AddControllers();

var app = builder.Build();

app.UseSwagger();

app.UseSwaggerUI(c =>
{
    c.SwaggerEndpoint("/swagger/v1/swagger.json", "Tasks API V1");
    c.OAuthClientId("tasks-api-swagger");
    c.OAuthClientSecret("z8JAzcmuTNfP1n5wqOonLugdpViA5tPp"); // Установите секрет из Keycloak
    c.OAuthUsePkce();
});

app.UseAuthentication();
app.UseAuthorization();
app.MapControllers();

app.Run();
