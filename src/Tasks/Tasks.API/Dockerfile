FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

COPY "Tasks/Tasks.API/Tasks.API.csproj" "Tasks/Tasks.API/Tasks.API.csproj"
COPY "Tasks/Tasks.Domain/Tasks.Domain.csproj" "Tasks/Tasks.Domain/Tasks.Domain.csproj"
COPY "Tasks/Tasks.Infrastructure/Tasks.Infrastructure.csproj" "Tasks/Tasks.Infrastructure/Tasks.Infrastructure.csproj"

RUN dotnet restore "Tasks/Tasks.API/Tasks.API.csproj"

COPY . .
WORKDIR /src/Tasks/Tasks.API
RUN dotnet publish -c Release -o /app

FROM build AS publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Tasks.API.dll"]
