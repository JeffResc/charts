# manyfold

Helm chart for deploying [manyfold](https://github.com/manyfold3d/manyfold).

This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/JeffResc/charts/issues/new).

## Source code

- https://github.com/manyfold3d/manyfold

## TL;DR
```
helm repo add jeffresc https://charts.jeffresc.dev
helm repo update
helm install manyfold jeffresc/manyfold
```

## Installing the Chart
To install the chart with the release name `manyfold`
```
helm install manyfold jeffresc/manyfold
```

## Uninstalling the Chart
To uninstall the `manyfold` deployment
```
helm uninstall manyfold
```

## Parameters

### Global parameters

| Name | Description | Value |
| --- | --- | --- |
| `replicaCount` | Number of replicas of the manyfold Deployment | `1` |
| `affinity` | Affinity for pod assignment | `{}` |
| `nodeSelector` | Node labels for pod assignment | `{}` |
| `tolerations` | Tolerations for pod assignment | `[]` |
| `podAnnotations` | Additional annotations for the Pod resource | `{}` |
| `podLabels` | Additional labels for the Pod resource | `{}` |
| `imagePullSecrets` | Docker registry pull secrets | `[]` |
| `nameOverride` | Name override | `""` |
| `fullnameOverride` | Full name override | `""` |

### Image parameters

| Name | Description | Value |
| --- | --- | --- |
| `image.repository` | Container image repository | `ghcr.io/manyfold3d/manyfold` |
| `image.pullPolicy` | Container image pull policy | `IfNotPresent` |
| `image.tag` | Overrides the image tag whose default is the chart appVersion | `""` |

### Service account parameters

| Name | Description | Value |
| --- | --- | --- |
| `serviceAccount.create` | Specifies whether a service account should be created | `false` |
| `serviceAccount.automount` | Automatically mount a ServiceAccount's API credentials? | `true` |
| `serviceAccount.annotations` | Additional annotations for the ServiceAccount resource | `{}` |
| `serviceAccount.name` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template | `""` |

### Pod security context parameters

| Name | Description | Value |
| --- | --- | --- |
| `podSecurityContext` | Additional pod security context | `{}` |

### Security context parameters

| Name | Description | Value |
| --- | --- | --- |
| `securityContext` | Container security context | `{}` |

### Service parameters

| Name | Description | Value |
| --- | --- | --- |
| `service.type` | Service type to create | `ClusterIP` |
| `service.port` | Service port to use | `3214` |

### Ingress parameters

| Name | Description | Value |
| --- | --- | --- |
| `ingress.enabled` | Enable ingress record generation | `false` |
| `ingress.className` | IngressClass that will be used to implement the Ingress | `""` |
| `ingress.annotations` | Additional annotations for the Ingress resource | `{}` |
| `ingress.hosts` | An array with hostname(s) to be covered with the ingress record | `[]` |
| `ingress.tls` | TLS configuration for hostname(s) to be covered with this ingress record | `[]` |

### Resources parameters

| Name | Description | Value |
| --- | --- | --- |
| `resources.requests.cpu` | Minimum CPU requested |  |
| `resources.requests.memory` | Minimum memory requested |  |
| `resources.limits.cpu` | Maximum CPU allowed |  |
| `resources.limits.memory` | Maximum memory allowed |  |

### Probe parameters

| Name | Description | Value |
| --- | --- | --- |
| `livenessProbe.httpGet.path` | HTTP path for the liveness probe | `/health` |
| `livenessProbe.httpGet.port` | Port name or number for the liveness probe | `http` |
| `readinessProbe.httpGet.path` | HTTP path for the readiness probe | `/health` |
| `readinessProbe.httpGet.port` | Port name or number for the readiness probe | `http` |

### Autoscaling parameters

| Name | Description | Value |
| --- | --- | --- |
| `autoscaling.enabled` | Enable Horizontal POD autoscaling | `false` |
| `autoscaling.minReplicas` | Minimum number of replicas | `1` |
| `autoscaling.maxReplicas` | Maximum number of replicas | `100` |
| `autoscaling.targetCPUUtilizationPercentage` | Target CPU utilization percentage | `80` |
| `autoscaling.targetMemoryUtilizationPercentage` | Target Memory utilization percentage |  |

### Extra volumes parameter

| Name | Description | Value |
| --- | --- | --- |
| `volumes` | Provide extra volumes for the main pod | `[]` |

### Extra volume mounts parameter

| Name | Description | Value |
| --- | --- | --- |
| `volumeMounts` | Additional volume mounts for the main pod | `[]` |

### Redis parameters

| Name | Description | Value |
| --- | --- | --- |
| `redis.enabled` | Deploy Redis chart | `false` |
| `redis.architecture` | Redis architecture | `standalone` |
| `redis.auth.enabled` | Enable Redis authentication | `false` |

### PostgreSQL parameters

| Name | Description | Value |
| --- | --- | --- |
| `postgresql.enabled` | Deploy PostgreSQL chart | `false` |
| `postgresql.global.postgresql.auth.username` | Database username | `manyfold` |
| `postgresql.global.postgresql.auth.database` | Database name | `manyfold` |
| `postgresql.global.postgresql.auth.password` | Database password | `manyfold` |

### Environment parameters

| Name | Description | Value |
| --- | --- | --- |
| `env.SECRET_KEY_BASE.value` | Secret key base | `super_secret_key` |
| `env.REDIS_URL.value` | Redis connection URL | `redis://{{ printf "%s-redis-master" .Release.Name }}:6379/1` |
| `env.DATABASE_ADAPTER.value` | Database adapter | `postgresql` |
| `env.DATABASE_HOST.value` | Database host | `{{ .Release.Name }}-postgresql` |
| `env.DATABASE_PORT.value` | Database port | `5432` |
| `env.DATABASE_USER.value` | Database user | `{{ .Values.postgresql.global.postgresql.auth.username }}` |
| `env.DATABASE_PASSWORD.value` | Database password | `{{ .Values.postgresql.global.postgresql.auth.password }}` |
| `env.DATABASE_NAME.value` | Database name | `{{ .Values.postgresql.global.postgresql.auth.database }}` |

### Persistence parameters

| Name | Description | Value |
| --- | --- | --- |
| `persistence.enabled` | If persistence is enabled | `false` |
| `persistence.name` | Persistent storage PVC name | `manyfold-library` |
| `persistence.mountPath` | Mount path | `/manyfold-library` |
| `persistence.storageClass` | Persistent storage PVC storage class | `""` |
| `persistence.size` | Persistent storage PVC size | `10Gi` |

### Init containers parameter

| Name | Description | Value |
| --- | --- | --- |
| `initContainers` | Provide init containers for the main pod | `[]` |

## Changelog

### 0.1.4
- Added Helm values schema for validation

### 0.1.1
- Initial release


