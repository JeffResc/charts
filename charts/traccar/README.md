# traccar

Helm chart for deploying [traccar](https://www.traccar.org/).

This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/JeffResc/charts/issues/new).

## Source code

- https://github.com/traccar/traccar

## TL;DR
```
helm repo add jeffresc https://charts.jeffresc.dev
helm repo update
helm install traccar jeffresc/traccar
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

## Parameters

### Global parameters

| Name               | Description                                   | Value         |
| ------------------ | --------------------------------------------- | ------------- |
| `replicaCount`     | Number of replicas of the traccar Deployment  | `1`           |
| `affinity`         | Affinity for pod assignment                   | `{}`          |
| `nodeSelector`     | Node labels for pod assignment                | `{}`          |
| `tolerations`      | Tolerations for pod assignment                | `[]`          |
| `podAnnotations`   | Additional annotations for the Pod resource   | `{}`          |
| `podLabels`        | Additional labels for the Pod resource        | `{}`          |
| `imagePullSecrets` | Docker registry pull secrets                  | `[]`          |
| `nameOverride`     | Name override                                 | `""`          |
| `fullnameOverride` | Full name override                            | `""`          |

### Image parameters

| Name               | Description                                                   | Value               |
| ------------------ | ------------------------------------------------------------- | ------------------- |
| `image.repository` | Container image repository                                    | `traccar/traccar`   |
| `image.pullPolicy` | Container image pull policy                                   | `IfNotPresent`      |
| `image.tag`        | Overrides the image tag whose default is the chart appVersion | `""`                |

### Service account parameters

| Name                         | Description                                                                                                            | Value   |
| ---------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ------- |
| `serviceAccount.create`      | Specifies whether a service account should be created                                                                  | `false` |
| `serviceAccount.automount`   | Automatically mount a ServiceAccount's API credentials?                                                                | `true`  |
| `serviceAccount.annotations` | Additional annotations for the ServiceAccount resource                                                                 | `{}`    |
| `serviceAccount.name`        | The name of the service account to use. If not set and create is true, a name is generated using the fullname template | `""`    |

### Security context parameters

| Name                                       | Description                                     | Value   |
| ------------------------------------------ | ----------------------------------------------- | --------|
| `securityContext`                          | Security context for the container              | `{}`    |
| `podSecurityContext`                       | Security context for the Pod                    | `{}`    |

### Service parameters

| Name           | Description            | Value       |
| -------------- | ---------------------- | ----------- |
| `service.type` | Service type to create | `ClusterIP` |
| `service.port` | Service port to use    | `8082`      |

### Ingress parameters

| Name                  | Description                                                              | Value   |
| --------------------- | ------------------------------------------------------------------------ | ------- |
| `ingress.enabled`     | Enable ingress record generation                                         | `false` |
| `ingress.className`   | IngressClass that will be used to implement the Ingress                  | `""`    |
| `ingress.annotations` | Additional annotations for the Ingress resource                          | `{}`    |
| `ingress.hosts`       | An array with hostname(s) to be covered with the ingress record          | `[{"host": "chart-example.local", "paths": ["/"]}]` |
| `ingress.tls`         | TLS configuration for hostname(s) to be covered with this ingress record | `[]`    |

### Resources parameters

| Name                        | Description              | Value |
| --------------------------- | ------------------------ | ----- |
| `resources`                 | Resource requests/limits | `{}`  |

### Autoscaling parameters

| Name                                            | Description                          | Value   |
| ----------------------------------------------- | ------------------------------------ | ------- |
| `autoscaling.enabled`                           | Enable Horizontal POD autoscaling    | `false` |
| `autoscaling.minReplicas`                       | Minimum number of replicas           | `1`     |
| `autoscaling.maxReplicas`                       | Maximum number of replicas           | `100`   |
| `autoscaling.targetCPUUtilizationPercentage`    | Target CPU utilization percentage    | `80`    |
| `autoscaling.targetMemoryUtilizationPercentage` | Target Memory utilization percentage | `Not set` (commented out) |

### Probes

| Name             | Description              | Value                      |
|------------------|--------------------------|----------------------------|
| `livenessProbe`  | Liveness HTTP probe      | `GET / on port http`       |
| `readinessProbe` | Readiness HTTP probe     | `GET / on port http`       |

### Extra volumes parameter

| Name           | Description                            | Value |
|----------------|----------------------------------------|-------|
| `volumes`      | Provide extra volumes for the main pod | `[]`  |

### Extra volume mounts parameter

| Name            | Description                                   | Value |
|-----------------|-----------------------------------------------|-------|
| `volumeMounts`  | Additional volume mounts for the main pod     | `[]`  |

### Traccar Configuration Parameters

| Name                    | Description                               | Value                            |
|-------------------------|-------------------------------------------|----------------------------------|
| `config.enabled`        | Enable Traccar configuration              | `true`                           |
| `config.database.driver`| JDBC driver for the database              | `org.h2.Driver`                  |
| `config.database.url`   | JDBC connection URL                       | `jdbc:h2:./data/database`        |
| `config.database.user`  | Database username                         | `sa`                             |
| `config.database.password` | Database password                      | `changeme`                       |

### Load balancer

| Name                         | Description                          | Value     |
|------------------------------|--------------------------------------|-----------|
| `loadbalancer.enabled`       | Enable load balancer feature         | `false`   |
| `loadbalancer.portRange.start` | Starting port for load balancer    | `5000`    |
| `loadbalancer.portRange.end`   | Ending port for load balancer      | `5150`    |

## Changelog

### 0.1.0
- Initial release
