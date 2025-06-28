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

| Name                                | Description                              | Value           |
|-------------------------------------|------------------------------------------|-----------------|
| `livenessProbe.httpGet.path`        | HTTP path for the liveness probe         | `/`             |
| `livenessProbe.httpGet.port`        | Port name or number for the liveness probe | `http`         |
| `readinessProbe.httpGet.path`       | HTTP path for the readiness probe        | `/`             |
| `readinessProbe.httpGet.port`       | Port name or number for the readiness probe | `http`        |

### Extra volumes parameter

| Name           | Description                            | Value |
|----------------|----------------------------------------|-------|
| `volumes`      | Provide extra volumes for the main pod | `[]`  |

### Extra volume mounts parameter

| Name            | Description                                   | Value |
|-----------------|-----------------------------------------------|-------|
| `volumeMounts`  | Additional volume mounts for the main pod     | `[]`  |

### Traccar Configuration Parameters

| Name                                | Description                                                              | Value                                 |
|-------------------------------------|--------------------------------------------------------------------------|---------------------------------------|
| `config.generate`                   | Indicates whether to auto-generate a configuration file                  | `true`                                |
| `config.secrets`                    | List of secrets to inject as environment variables                       | `[{ key: database.password, env: DATABASE_PASSWORD, secretRef: traccar-mysql, secretKey: mysql-password }]` |
| `config.secrets`                    | Configuration secrets                                                    | `{}}`                   |
| `config.values.database.driver`     | JDBC driver class name for the database                                  | `com.mysql.cj.jdbc.Driver`            |
| `config.values.database.user`       | Username used to connect to the database                                 | `traccar`                             |
| `config.values.database.url`        | JDBC connection URL for the MySQL database 

### Init Container Parameters

| Name                              | Description                                                  | Value         |
|-----------------------------------|--------------------------------------------------------------|---------------|
| `initContainer.enabled`           | Enable init container                                        | `true`        |
| `initContainer.image.repository`  | Init container image repository                              | `busybox`     |
| `initContainer.image.pullPolicy`  | Init container image pull policy                             | `IfNotPresent`|
| `initContainer.image.tag`         | Tag of the init container image                              | `"1.37"`      |
| `initContainer.image.securityContext` | Security context for the init container image             | `{}`          |

### Load Balancer Parameters

| Name                         | Description                          | Value     |
|------------------------------|--------------------------------------|-----------|
| `loadbalancer.enabled`       | Enable load balancer feature         | `false`   |
| `loadbalancer.portRange.start` | Starting port for load balancer    | `5000`    |
| `loadbalancer.portRange.end`   | Ending port for load balancer      | `5150`    |

### MySQL Configuration Parameters

| Name                      | Description                                   | Value     |
|---------------------------|-----------------------------------------------|-----------|
| `mysql.enabled`           | Enable bundled MySQL deployment               | `false`   |
| `mysql.auth.database`     | Name of the MySQL database to create/use      | `traccar` |
| `mysql.auth.username`     | Username for the MySQL database               | `traccar` |

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
