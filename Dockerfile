FROM mcr.microsoft.com/dotnet/core/runtime-deps:2.2-stretch-slim AS runtime
# FROM microsoft/dotnet:2.2.0-runtime
LABEL name "docker-example"

FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build

WORKDIR /app
COPY out .
COPY . /app

ENV ASPNETCORE_URLS http://*:80
EXPOSE 80

ENTRYPOINT ["dotnet",  "docker-example.dll"]

