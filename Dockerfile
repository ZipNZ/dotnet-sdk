FROM mcr.microsoft.com/dotnet/sdk:5.0

# Copy 3.1 .net runtime
COPY --from=mcr.microsoft.com/dotnet/core/aspnet:3.1 /usr/share/dotnet /usr/share/dotnet

RUN apt-get update && apt-get install make zip gpg -y && \
    dotnet tool install dotnet-reportgenerator-globaltool --tool-path /coverage

RUN apt-get update && apt-get --no-install-recommends install -y ca-certificates curl apt-transport-https lsb-release gnupg && \
    curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null && \
    AZ_REPO=$(lsb_release -cs) && \
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | tee /etc/apt/sources.list.d/azure-cli.list && \
    apt-get update && apt-get install -y azure-cli dos2unix && \
    rm -rf /var/lib/apt/lists/*
