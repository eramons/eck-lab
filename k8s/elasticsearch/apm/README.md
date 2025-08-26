These manifests intend to deploy Elastic's APM server as an ECK custom resource.

Install the overlay:
```
k8s % kubectl apply -k elasticsearch/apm
```

As a demo application to deliver APM data to Elastic, install version 1.12.0 of the Elastic fork of the OpenTelemetry Demo, available as a terraform module [in this repo](../../../terraform/modules/opentel/): 
```
terraform % terraform apply -var deploy_opentel=true
```
The application is configured to send data to the apm-server.

Notes: 
 * The installation of the opentelemetry demo will only complete successfully after the apm-server is up and running. 
 * Starting with opentelemetry demo version 2.x, the open telemetry collector is used instead of the apm-server. In order for the demo to work with the apm-server, the opentelemetry version needs to be 1.12.0 (helm chart 0.35.1). The chart version in the terraform declaration is pinned to this version. 
