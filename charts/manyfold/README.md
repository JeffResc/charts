# manyfold

Helm chart for deploying [manyfold](https://github.com/manyfold3d/manyfold).

This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/JeffResc/charts/issues/new).

## Source code

- https://github.com/manyfold3d/manyfold

## TL;DR

### Using Helm Repository
```
helm repo add jeffresc https://charts.jeffresc.dev
helm repo update
helm install manyfold jeffresc/manyfold
```

### Using OCI Registry (GHCR)
```
helm install manyfold oci://ghcr.io/jeffresc/charts/manyfold
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

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity for pod assignment |
| autoscaling.enabled | bool | `false` | Enable Horizontal POD autoscaling |
| autoscaling.maxReplicas | int | `100` | Maximum number of replicas |
| autoscaling.minReplicas | int | `1` | Minimum number of replicas |
| autoscaling.targetCPUUtilizationPercentage | int | `80` | Target CPU utilization percentage |
| env.DATABASE_ADAPTER.value | string | `"postgresql"` |  |
| env.DATABASE_HOST.value | string | `"{{ .Release.Name }}-postgresql"` |  |
| env.DATABASE_NAME.value | string | `"{{ .Values.postgresql.global.postgresql.auth.database }}"` |  |
| env.DATABASE_PASSWORD | object | `{"value":"{{ .Values.postgresql.global.postgresql.auth.password }}"}` | You should provide your own secret outside of this helm-chart and use `postgresql.global.postgresql.auth.existingSecret` to provide credentials to the postgresql instance |
| env.DATABASE_PORT.value | string | `"5432"` |  |
| env.DATABASE_USER.value | string | `"{{ .Values.postgresql.global.postgresql.auth.username }}"` |  |
| env.REDIS_URL.value | string | `"redis://{{ printf \"%s-valkey-master\" .Release.Name }}:6379/1"` |  |
| env.SECRET_KEY_BASE.value | string | `"super_secret_key"` |  |
| fullnameOverride | string | `""` | Full name override |
| image.pullPolicy | string | `"IfNotPresent"` | Container image pull policy |
| image.repository | string | `"ghcr.io/manyfold3d/manyfold"` | Container image repository |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion |
| imagePullSecrets | list | `[]` | Docker registry pull secrets |
| ingress.annotations | object | `{}` | Additional annotations for the Ingress resource |
| ingress.className | string | `""` | IngressClass that will be used to implement the Ingress |
| ingress.enabled | bool | `false` | Enable ingress record generation |
| ingress.hosts | list | `[]` | An array with hostname(s) to be covered with the ingress record |
| ingress.tls | list | `[]` | TLS configuration for hostname(s) to be covered with this ingress record |
| initContainers | list | `[]` | Provide init containers for the main pod |
| livenessProbe.httpGet.path | string | `"/health"` | HTTP path for the liveness probe |
| livenessProbe.httpGet.port | string | `"http"` | Port name or number for the liveness probe |
| nameOverride | string | `""` | Name override |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| persistence.enabled | bool | `false` | If persistence is enabled |
| persistence.mountPath | string | `"/manyfold-library"` | Mount path |
| persistence.name | string | `"manyfold-library"` | Persistent storage PVC name |
| persistence.size | string | `"10Gi"` | Persistent storage PVC size |
| persistence.storageClass | string | `""` | Persistent storage PVC storage class |
| podAnnotations | object | `{}` | Additional annotations for the Pod resource |
| podLabels | object | `{}` | Additional labels for the Pod resource |
| podSecurityContext | object | `{}` | Additional pod security context |
| postgresql.enabled | bool | `false` | Deploy PostgreSQL chart |
| postgresql.global.postgresql.auth.database | string | `"manyfold"` | Database name |
| postgresql.global.postgresql.auth.password | string | `"manyfold"` | Database password |
| postgresql.global.postgresql.auth.username | string | `"manyfold"` | Database username |
| readinessProbe.httpGet.path | string | `"/health"` | HTTP path for the readiness probe |
| readinessProbe.httpGet.port | string | `"http"` | Port name or number for the readiness probe |
| replicaCount | int | `1` | Number of replicas of the manyfold Deployment |
| resources | object | `{}` |  |
| securityContext | object | `{}` | Container security context |
| service.port | int | `3214` | Service port to use |
| service.type | string | `"ClusterIP"` | Service type to create |
| serviceAccount.annotations | object | `{}` | Additional annotations for the ServiceAccount resource |
| serviceAccount.automount | bool | `true` | Automatically mount a ServiceAccount's API credentials? |
| serviceAccount.create | bool | `false` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | Tolerations for pod assignment |
| valkey.architecture | string | `"standalone"` | Valkey architecture |
| valkey.auth.enabled | bool | `false` | Enable Valkey authentication |
| valkey.enabled | bool | `false` | Deploy Valkey chart |
| volumeMounts | list | `[]` | Additional volume mounts for the main pod |
| volumes | list | `[]` | Provide extra volumes for the main pod |

## Changelog

See [CHANGELOG.md](./CHANGELOG.md) for the full release history.
