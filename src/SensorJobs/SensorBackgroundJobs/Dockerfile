#See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/runtime:8.0 AS base
RUN apt-get update && apt-get install -y iputils-ping
USER app
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["SensorBackgroundJobs/SensorBackgroundJobs.csproj", "SensorBackgroundJobs/"]
RUN dotnet restore "./SensorBackgroundJobs/SensorBackgroundJobs.csproj"
COPY . .
WORKDIR "/src/SensorBackgroundJobs"
RUN dotnet build "./SensorBackgroundJobs.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./SensorBackgroundJobs.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "SensorBackgroundJobs.dll"]