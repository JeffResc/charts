<p align="center">
    <img width="200px" height=auto src="https://helm.sh/img/helm.svg" />
</p>

<p align="center">
    <a href="https://github.com/JeffResc/charts"><img src="https://badgen.net/github/stars/JeffResc/charts?icon=github" /></a>
    <a href="https://github.com/JeffResc/charts"><img src="https://badgen.net/github/forks/JeffResc/charts?icon=github" /></a>
    <a href="https://artifacthub.io/packages/search?repo=jeffresc"><img src="https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/jeffresc" /></a>
</p>

# JeffResc's Library for Kubernetes

Popular applications, provided by [JeffResc](https://jeffresc.dev), ready to launch on Kubernetes using [Kubernetes Helm](https://github.com/helm/helm).

## TL;DR

### Using Helm Repository
```shell
helm repo add jeffresc https://charts.jeffresc.dev
helm repo update
helm install <chart-name> jeffresc/<chart-name>
```

### Using OCI Registry (GHCR)
```shell
helm install <chart-name> oci://ghcr.io/jeffresc/charts/<chart-name>
```

## Available Charts

> For full documentation including parameters and changelogs, visit [charts.jeffresc.dev](https://charts.jeffresc.dev).

<!-- CHARTS_TABLE_START -->
<table>
<thead>
<tr class="header">
<th><strong>Chart</strong></th>
<th><strong>Chart Version</strong></th>
<th><strong>App Version</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td markdown="span">13ft</td>
<td markdown="span">0.1.2</td>
<td markdown="span">0.3.4</td>
<td markdown="span">Custom 12ft.io replacement</td>
</tr>
<tr>
<td markdown="span">esphome</td>
<td markdown="span">0.2.0</td>
<td markdown="span">2026.3.2</td>
<td markdown="span">ESPHome is a system to control your microcontrollers by simple yet powerful configuration files and control them remotely through Home Automation systems.</td>
</tr>
<tr>
<td markdown="span">it-tools</td>
<td markdown="span">0.1.5</td>
<td markdown="span">2026.1.4</td>
<td markdown="span">Collection of handy online tools for developers, with great UX</td>
</tr>
<tr>
<td markdown="span">manyfold</td>
<td markdown="span">0.2.0</td>
<td markdown="span">0.136.0</td>
<td markdown="span">Organize and share your 3d print files</td>
</tr>
<tr>
<td markdown="span">newt</td>
<td markdown="span">0.2.0</td>
<td markdown="span">1.10.4</td>
<td markdown="span">Tunneling client for Pangolin - secure WireGuard proxy</td>
</tr>
<tr>
<td markdown="span">traccar</td>
<td markdown="span">0.1.9</td>
<td markdown="span">6.12-alpine</td>
<td markdown="span">Modern GPS Tracking Platform</td>
</tr>
</tbody>
</table>
<!-- CHARTS_TABLE_END -->
