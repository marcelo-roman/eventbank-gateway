FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src
COPY . .
RUN dotnet publish src/EventBank.Gateway/EventBank.Gateway.csproj --configuration Release --output /app

FROM mcr.microsoft.com/dotnet/aspnet:10.0
ENV ASPNETCORE_HTTP_PORTS=8080
WORKDIR /app
COPY --from=build /app .
USER app
EXPOSE 8080
ENTRYPOINT ["dotnet", "EventBank.Gateway.dll"]
