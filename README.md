# Overview

This is the deployment information for the C# [RSSFeedPuller](https://github.com/scotcurry/RSSFeedPuller) project.

## Docker-rssfeedpuller-k8s

This is used to build a Docker image that **DOES NOT** have the Datadog tracing library embedded in it.  This project is built to use [Datadog Dynamic Instrumentation](https://docs.datadoghq.com/dynamic_instrumentation/)

## rssfeedpuller-deployment.yaml

A well commented deployment file with links to the underlying Kubernetes documentation.

## rssfeedpuller-service.yaml

A well commented services file with links to the underlying Kubernetes documentation.

## secrets.yaml

Not added to the repository has it has the API keys.  Fomat is:
```
kubectl create secret generic datadog-secret --from-literal api-key=<API KEY> --from-literal app-key=<APP KEY>
```