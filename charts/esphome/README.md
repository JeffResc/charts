# esphome
Fully functioning Helm chart for [ESPHome](https://esphome.io/index.html).

### Features
- Runs rootless with no capabilities
- Dynamically create PVC for config directory
- Creates single-replica statefulset for ESPHome
- Create service
- Create ingress

### Installation instructions
1. [Add repository to Helm](https://github.com/JeffResc/charts/blob/main/README.md#add-repository-to-helm)
2. `helm install esphome jeffresc/esphome --namespace esphome --create-namespace`