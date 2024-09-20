# it-tools

Helm chart for deploying [it-tools](https://github.com/CorentinTh/it-tools).

This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/JeffResc/charts/issues/new).

## Source code

- https://github.com/CorentinTh/it-tools

## TL;DR
```
helm repo add jeffresc https://charts.jeffresc.dev
helm repo update
helm install it-tools jeffresc/it-tools
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

## Parameters

### Global parameters

| Name               | Description                                   | Value |
| ------------------ | --------------------------------------------- | ----- |
| `replicaCount`     | Number of replicas of the it-tools Deployment | `1`   |
| `affinity`         | Affinity for pod assignment                   | `{}`  |
| `nodeSelector`     | Node labels for pod assignment                | `{}`  |
| `tolerations`      | Tolerations for pod assignment                | `[]`  |
| `podAnnotations`   | Additional annotations for the Pod resource   | `{}`  |
| `podLabels`        | Additional labels for the Pod resource        | `{}`  |
| `imagePullSecrets` | Docker registry pull secrets                  | `[]`  |
| `nameOverride`     | Name override                                 | `""`  |
| `fullnameOverride` | Full name override                            | `""`  |

### Image parameters

| Name               | Description                                                   | Value                         |
| ------------------ | ------------------------------------------------------------- | ----------------------------- |
| `image.repository` | Docker image repository                                       | `ghcr.io/corentinth/it-tools` |
| `image.pullPolicy` | Docker image pull policy                                      | `IfNotPresent`                |
| `image.tag`        | Overrides the image tag whose default is the chart appVersion | `""`                          |

### Service account parameters

| Name                         | Description                                                                                                            | Value   |
| ---------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ------- |
| `serviceAccount.create`      | Specifies whether a service account should be created                                                                  | `false` |
| `serviceAccount.automount`   | Automatically mount a ServiceAccount's API credentials?                                                                | `true`  |
| `serviceAccount.annotations` | Additional annotations for the ServiceAccount resource                                                                 | `{}`    |
| `serviceAccount.name`        | The name of the service account to use. If not set and create is true, a name is generated using the fullname template | `""`    |

### Security context parameters

| Name                                       | Description                               | Value            |
| ------------------------------------------ | ----------------------------------------- | ---------------- |
| `securityContext.capabilities.drop`        | Capabilities to drop                      | `["ALL"]`        |
| `securityContext.readOnlyRootFilesystem`   | If root filesystem should be read-only    | `true`           |
| `securityContext.runAsNonRoot`             | If pod should be run as non-root          | `true`           |
| `securityContext.runAsUser`                | User to run pod as                        | `10099`          |
| `securityContext.runAsGroup`               | Group to run pod as                       | `10099`          |
| `securityContext.allowPrivilegeEscalation` | If privilege escalation should be allowed | `false`          |
| `securityContext.seccompProfile.type`      | seccomp profile type                      | `RuntimeDefault` |

### Service parameters

| Name           | Description            | Value       |
| -------------- | ---------------------- | ----------- |
| `service.type` | Service type to create | `ClusterIP` |
| `service.port` | Service port to use    | `80`        |

### Ingress parameters

| Name                  | Description                                                              | Value   |
| --------------------- | ------------------------------------------------------------------------ | ------- |
| `ingress.enabled`     | Enable ingress record generation                                         | `false` |
| `ingress.className`   | IngressClass that will be be used to implement the Ingress               | `""`    |
| `ingress.annotations` | Additional annotations for the Ingress resource                          | `{}`    |
| `ingress.hosts`       | An array with hostname(s) to be covered with the ingress record          | `[]`    |
| `ingress.tls`         | TLS configuration for hostname(s) to be covered with this ingress record | `[]`    |

### Resources parameters

| Name                        | Description              | Value  |
| --------------------------- | ------------------------ | ------ |
| `resources.requests.cpu`    | Minimum CPU requested    | `10m`  |
| `resources.requests.memory` | Minimum memory requested | `16Mi` |
| `resources.limits.cpu`      | Maximum CPU allowed      |        |
| `resources.limits.memory`   | Maximum memory allowed   |        |

### Autoscaling parameters

| Name                                            | Description                          | Value   |
| ----------------------------------------------- | ------------------------------------ | ------- |
| `autoscaling.enabled`                           | Enable Horizontal POD autoscaling    | `false` |
| `autoscaling.minReplicas`                       | Minimum number of replicas           | `1`     |
| `autoscaling.maxReplicas`                       | Maximum number of replicas           | `100`   |
| `autoscaling.targetCPUUtilizationPercentage`    | Target CPU utilization percentage    | `80`    |
| `autoscaling.targetMemoryUtilizationPercentage` | Target Memory utilization percentage | `80`    |

### Nginx configuration parameters
| Name                          | Description                                               | Value |
|-------------------------------|-----------------------------------------------------------|-------|
| `nginxConf.existingConfigmap` | Provide an existing ConfigMap for the Nginx configuration | `""`  |

### Extra volumes parameter
| Name           | Description                            | Value |
|----------------|----------------------------------------|-------|
| `extraVolumes` | Provide extra volumes for the main pod | `[]`  |

### Extra containers parameter
| Name              | Description                               | Value |
|-------------------|-------------------------------------------|-------|
| `extraContainers` | Provide extra containers for the main pod | `[]`  |

## Changelog

### 0.0.2
Add support for nginxConf.existingConfigmap, extraVolumes, extraContainers

### 0.0.1
Initial release