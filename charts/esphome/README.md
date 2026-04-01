# esphome

Helm chart for deploying [ESPHome](https://esphome.io/index.html).

This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/JeffResc/charts/issues/new).

## Source code

- https://github.com/esphome/esphome

## TL;DR

### Using Helm Repository
```
helm repo add jeffresc https://charts.jeffresc.dev
helm repo update
helm install esphome jeffresc/esphome
```

### Using OCI Registry (GHCR)
```
helm install esphome oci://ghcr.io/jeffresc/charts/esphome
```

## Installing the Chart
To install the chart with the release name `esphome`
```
helm install esphome jeffresc/esphome
```

## Uninstalling the Chart
To uninstall the `esphome` deployment
```
helm uninstall esphome
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
| fullnameOverride | string | `""` | Full name override |
| image.pullPolicy | string | `"IfNotPresent"` | Docker image pull policy |
| image.repository | string | `"ghcr.io/esphome/esphome"` | Docker image repository |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion |
| imagePullSecrets | list | `[]` | Docker registry pull secrets |
| ingress.annotations | object | `{}` | Additional annotations for the Ingress resource |
| ingress.className | string | `""` | IngressClass that will be be used to implement the Ingress |
| ingress.enabled | bool | `false` | Enable ingress record generation |
| ingress.hosts | list | `[]` | An array with hostname(s) to be covered with the ingress record |
| ingress.tls | list | `[]` | TLS configuration for hostname(s) to be covered with this ingress record |
| nameOverride | string | `""` | Name override |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| persistence.enabled | bool | `false` | If persistence is enabled |
| persistence.name | string | `"esphome-config"` | Persistent storage PVC name |
| persistence.size | string | `"5Gi"` | Persistent storage PVC size |
| persistence.storageClass | string | `"my-storageclass"` | Persistent storage PVC storage class |
| podAnnotations | object | `{}` | Additional annotations for the Pod resource |
| podLabels | object | `{}` | Additional labels for the Pod resource |
| podSecurityContext.fsGroup | int | `10099` | Group to mount volumes in as |
| podSecurityContext.runAsUser | int | `10099` | User to run pod as |
| replicaCount | int | `1` | Number of replicas of the ESPHome StatefulSet |
| resources.requests.cpu | string | `"10m"` | Minimum CPU requested |
| resources.requests.memory | string | `"128Mi"` | Minimum memory requested |
| securityContext.allowPrivilegeEscalation | bool | `false` | If privilege escalation should be allowed |
| securityContext.capabilities.drop | list | `["ALL"]` | Capabilities to drop |
| securityContext.readOnlyRootFilesystem | bool | `true` | If root filesystem should be read-only |
| securityContext.runAsGroup | int | `10099` | Group to run pod as |
| securityContext.runAsNonRoot | bool | `true` | If pod should be run as non-root |
| securityContext.runAsUser | int | `10099` | User to run pod as |
| securityContext.seccompProfile.type | string | `"RuntimeDefault"` | seccomp profile type |
| service.port | int | `6052` | Service port to use |
| service.type | string | `"ClusterIP"` | Service type to create |
| serviceAccount.annotations | object | `{}` | Additional annotations for the ServiceAccount resource |
| serviceAccount.automount | bool | `true` | Automatically mount a ServiceAccount's API credentials? |
| serviceAccount.create | bool | `false` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | Tolerations for pod assignment |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |

## Changelog

### 0.1.10
- Update appVersion to 2025.6.3

### 0.1.8
- Added Helm values schema for validation

### 0.1.4
- updated default esphome container image to 2025.4.1

### 0.0.2
- Provided updated documentation

### 0.0.1
- Initial release
