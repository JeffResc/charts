# newt

Helm chart for deploying [newt](https://github.com/fosrl/newt).

Newt is a tunneling client for Pangolin - a fully user space WireGuard tunnel client and TCP/UDP proxy, designed to securely expose private resources controlled by Pangolin.

This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/JeffResc/charts/issues/new).

## Source code

- https://github.com/fosrl/newt

## TL;DR

### Using Helm Repository
```
helm repo add jeffresc https://charts.jeffresc.dev
helm repo update
helm install newt jeffresc/newt
```

### Using OCI Registry (GHCR)
```
helm install newt oci://ghcr.io/jeffresc/charts/newt
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

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| image.repository | string | `"fosrl/newt"` | Docker image repository |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion |
| pangolin.endpoint | string | `"https://pangolin.example.com"` | Pangolin server endpoint URL |
| replicas | int | `1` | Number of replicas to deploy |
| resources | object | `{}` | Resource limits and requests for the container |
| secret.id.key | string | `"newt_id"` | Key in the secret for Newt ID |
| secret.name | string | `"newt-secrets"` | Name of the secret containing Newt credentials |
| secret.secret.key | string | `"newt_secret"` | Key in the secret for Newt secret |

## Prerequisites

Before installing this chart, you need to create a Kubernetes secret containing your Newt credentials:

```bash
kubectl create secret generic newt-secrets \
  --from-literal=newt_id=your_newt_id \
  --from-literal=newt_secret=your_newt_secret
```

## Changelog

See [CHANGELOG.md](./CHANGELOG.md) for the full release history.
