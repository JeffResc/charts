# newt

Helm chart for deploying [newt](https://github.com/fosrl/newt).

Newt is a tunneling client for Pangolin - a fully user space WireGuard tunnel client and TCP/UDP proxy, designed to securely expose private resources controlled by Pangolin.

This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/JeffResc/charts/issues/new).

## Source code

- https://github.com/fosrl/newt

## TL;DR
```
helm repo add jeffresc https://charts.jeffresc.dev
helm repo update
helm install newt jeffresc/newt
```

## Installing the Chart
To install the chart with the release name `newt`
```
helm install newt jeffresc/newt
```

## Uninstalling the Chart
To uninstall the `newt` deployment
```
helm uninstall newt
```

## Parameters

### Pangolin parameters

| Name                | Description                        | Value                             |
| ------------------- | ---------------------------------- | --------------------------------- |
| `pangolin.endpoint` | Pangolin server endpoint URL       | `https://pangolin.example.com`    |

### Secret parameters

| Name               | Description                              | Value            |
| ------------------ | ---------------------------------------- | ---------------- |
| `secret.name`      | Name of the secret containing Newt credentials | `newt-secrets`   |
| `secret.id.key`    | Key in the secret for Newt ID           | `newt_id`        |
| `secret.secret.key`| Key in the secret for Newt secret       | `newt_secret`    |

### Image parameters

| Name               | Description                                                   | Value          |
| ------------------ | ------------------------------------------------------------- | -------------- |
| `image.repository` | Docker image repository                                       | `fosrl/newt`   |
| `image.tag`        | Overrides the image tag whose default is the chart appVersion | `""`           |

## Prerequisites

Before installing this chart, you need to create a Kubernetes secret containing your Newt credentials:

```bash
kubectl create secret generic newt-secrets \
  --from-literal=newt_id=your_newt_id \
  --from-literal=newt_secret=your_newt_secret
```

## Changelog

### 0.1.0
- Initial release