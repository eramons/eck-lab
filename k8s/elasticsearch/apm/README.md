This demo uses the APM server deployed as an ECK custom resource: 

1. Install the overlay:
```
k8s % kubectl apply -k elasticsearch/apm
```
2. Install the opentelemetry demo, declared as a terraform module: 
```
terraform % terraform apply -var deploy_opentel=true
```

Notes: 
 * The installation of the opentelemetry demo will only work in the apm-server is up and running. 
 * Starting with opentelemetry version 2.x, the open telemetry collector is used instead of the apm-server. In order for the demo to work with the apm-server, the opentelemetry version needs to be 1.12.0 (helm chart 0.35.1). The chart version in the terraform declaration is pinned to this version. 
