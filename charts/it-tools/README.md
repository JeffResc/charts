# it-tools

Helm chart for deploying [it-tools](https://github.com/sharevb/it-tools).

This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/JeffResc/charts/issues/new).

[it-tools sharebv](https://github.com/sharevb/it-tools) was forked from [it-tools CorentinTh](https://github.com/CorentinTh/it-tools).
The latest release of [it-tools CorentinTh](https://github.com/CorentinTh/it-tools) was [v2024.10.22-7ca5933](https://github.com/CorentinTh/it-tools/releases/tag/v2024.10.22-7ca5933) on October 22, 2024.
[it-tools sharebv](https://github.com/sharevb/it-tools) is currently actively maintained.

## Source code

- https://github.com/sharevb/it-tools

## TL;DR

### Using Helm Repository
```
helm repo add jeffresc https://charts.jeffresc.dev
helm repo update
helm install it-tools jeffresc/it-tools
```

### Using OCI Registry (GHCR)
```
helm install it-tools oci://ghcr.io/jeffresc/charts/it-tools
```

## Installing the Chart
To install the chart with the release name `it-tools`
```
helm install it-tools jeffresc/it-tools
```

## Uninstalling the Chart
To uninstall the `it-tools` deployment
```
helm uninstall it-tools
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity for pod assignment |
| autoscaling.enabled | bool | `false` | Enable Horizontal POD autoscaling |
| autoscaling.maxReplicas | int | `100` | Maximum number of replicas |
| autoscaling.minReplicas | int | `1` | Minimum number of replicas |
| autoscaling.targetCPUUtilizationPercentage | int | `80` | Target CPU utilization percentage |
| autoscaling.targetMemoryUtilizationPercentage | int | `80` | Target Memory utilization percentage |
| extraContainers | list | `[]` | Provide extra containers for the main pod |
| extraVolumes | list | `[]` | Provide extra volumes for the main pod |
| fullnameOverride | string | `""` | Full name override |
| image.pullPolicy | string | `"IfNotPresent"` | Container image pull policy |
| image.repository | string | `"ghcr.io/sharevb/it-tools"` | Container image repository |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion |
| imagePullSecrets | list | `[]` | Docker registry pull secrets |
| ingress.annotations | object | `{}` | Additional annotations for the Ingress resource |
| ingress.className | string | `""` | IngressClass that will be be used to implement the Ingress |
| ingress.enabled | bool | `false` | Enable ingress record generation |
| ingress.hosts | list | `[]` | An array with hostname(s) to be covered with the ingress record |
| ingress.tls | list | `[]` | TLS configuration for hostname(s) to be covered with this ingress record |
| metrics.args | list | `["--nginx.scrape-uri=http://localhost:8081/stub_status"]` | Metrics container command arguments |
| metrics.containerName | string | `"nginx-prometheus-exporter"` | Nginx Prometheus exporter container name |
| metrics.enabled | bool | `false` | Enables metrics |
| metrics.image.pullPolicy | string | `"IfNotPresent"` | Metrics Container image pull policy |
| metrics.image.repository | string | `"nginx/nginx-prometheus-exporter"` | Metrics Container image repository |
| metrics.image.tag | string | `"1.5.1"` | Overrides the metrics image tag |
| metrics.port | int | `9113` | Metrics port number |
| metrics.portName | string | `"metrics"` | Metrics port name |
| metrics.resources | object | `{}` |  |
| metrics.securityContext.allowPrivilegeEscalation | bool | `false` | If privilege escalation should be allowed |
| metrics.securityContext.capabilities.drop | list | `["ALL"]` | Capabilities to drop |
| metrics.securityContext.readOnlyRootFilesystem | bool | `true` | If root filesystem should be read-only |
| metrics.securityContext.runAsGroup | int | `10099` | Group to run pod as |
| metrics.securityContext.runAsNonRoot | bool | `true` | If pod should be run as non-root |
| metrics.securityContext.runAsUser | int | `10099` | User to run pod as |
| metrics.securityContext.seccompProfile.type | string | `"RuntimeDefault"` | seccomp profile type |
| nameOverride | string | `""` | Name override |
| nginxConf.cachePath | string | `"/var/cache/nginx"` | Provide a cache path override (useful for other it-tools images such as Chainguard) |
| nginxConf.existingConfigmap | string | `""` | Provide an existing ConfigMap for the Nginx configuration |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| podAnnotations | object | `{}` | Additional annotations for the Pod resource |
| podLabels | object | `{}` | Additional labels for the Pod resource |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` | Number of replicas of the it-tools Deployment |
| resources | object | `{}` |  |
| securityContext.allowPrivilegeEscalation | bool | `false` | If privilege escalation should be allowed |
| securityContext.capabilities.drop | list | `["ALL"]` | Capabilities to drop |
| securityContext.readOnlyRootFilesystem | bool | `true` | If root filesystem should be read-only |
| securityContext.runAsGroup | int | `10099` | Group to run container as |
| securityContext.runAsNonRoot | bool | `true` | If container should be run as non-root |
| securityContext.runAsUser | int | `10099` | User to run container as |
| securityContext.seccompProfile.type | string | `"RuntimeDefault"` | seccomp profile type |
| service.port | int | `8080` | Service port to use |
| service.type | string | `"ClusterIP"` | Service type to create |
| serviceAccount.annotations | object | `{}` | Additional annotations for the ServiceAccount resource |
| serviceAccount.automount | bool | `true` | Automatically mount a ServiceAccount's API credentials? |
| serviceAccount.create | bool | `false` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | Tolerations for pod assignment |

## Changelog

See [CHANGELOG.md](./CHANGELOG.md) for the full release history.
