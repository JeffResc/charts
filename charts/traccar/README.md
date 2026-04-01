# traccar

Helm chart for deploying [traccar](https://www.traccar.org/).

This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/JeffResc/charts/issues/new).

## Source code

- https://github.com/traccar/traccar

## TL;DR

### Using Helm Repository
```
helm repo add jeffresc https://charts.jeffresc.dev
helm repo update
helm install traccar jeffresc/traccar
```

### Using OCI Registry (GHCR)
```
helm install traccar oci://ghcr.io/jeffresc/charts/traccar
```

## Installing the Chart
To install the chart with the release name `traccar`
```
helm install traccar jeffresc/traccar
```

## Uninstalling the Chart
To uninstall the `traccar` deployment
```
helm uninstall traccar
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| config.generate | bool | `true` |  |
| config.secrets[0].env | string | `"DATABASE-PASSWORD"` |  |
| config.secrets[0].key | string | `"database.password"` |  |
| config.secrets[0].secretKey | string | `"mysql-password"` |  |
| config.secrets[0].secretRef | string | `"traccar-mysql"` |  |
| config.values."database.driver" | string | `"com.mysql.cj.jdbc.Driver"` |  |
| config.values."database.url" | string | `"jdbc:mysql://traccar-mysql/traccar"` |  |
| config.values."database.user" | string | `"traccar"` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"traccar/traccar"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| initContainer.enabled | bool | `true` |  |
| initContainer.image.pullPolicy | string | `"IfNotPresent"` |  |
| initContainer.image.repository | string | `"busybox"` |  |
| initContainer.image.securityContext | object | `{}` |  |
| initContainer.image.tag | string | `"1.37"` |  |
| livenessProbe.httpGet.path | string | `"/"` |  |
| livenessProbe.httpGet.port | string | `"http"` |  |
| loadBalancer.enabled | bool | `false` |  |
| loadBalancer.portRange.end | int | `5150` |  |
| loadBalancer.portRange.start | int | `5000` |  |
| mysql.auth.database | string | `"traccar"` |  |
| mysql.auth.username | string | `"traccar"` |  |
| mysql.enabled | bool | `false` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| readinessProbe.httpGet.path | string | `"/"` |  |
| readinessProbe.httpGet.port | string | `"http"` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `8082` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |

## Changelog

### 0.1.6
- Added Helm values schema for validation

### 0.1.3
- Configuration secret hotfix

### 0.1.2
- Add support for configuration secrets

### 0.1.1
- MySQL database integration

### 0.1.0
- Initial release
