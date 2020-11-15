# dotnet SDK 3.1

This repository contains the dockerfile to create an image based off of [dotnet sdk](https://hub.docker.com/_/microsoft-dotnet-sdk/), along with some additional tools installed that are useful during deployments.

Additional tools installed include:
* [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/?view=azure-cli-latest)
* dotnet reportgenerator
* Zip
* Make


The main use for this image is to ready-bake the installation.

Currently, this image is hosted on [Dockerhub](https://hub.docker.com/repository/docker/njlnick/dotnet-sdk)

## Prerequisites

* [Docker](https://docs.docker.com/get-docker/)

## How to build image

```bash
docker build .
```
