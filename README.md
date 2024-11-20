# Monitoring Dashboard for Hardware Accelerators

Reference: [OpenShift Console UI Monitoring Dashboard Definition](https://access.redhat.com/solutions/7013854)

## Deployment

Use the dashboard definition [`accelerators-dashboard.json`](./accelerators-dashboard.json):

```console
oc create configmap accelerator-exporter-dashboard -n openshift-config-managed --from-file=accelerators-dashboard.json
oc label configmap accelerator-exporter-dashboard -n openshift-config-managed "console.openshift.io/dashboard=true"
```

or run [`update-config-map.sh`](./update-config-map.sh)

## Development

Use the scripts under [`devel`](./devel/) to start Prometheus, a push gateway and Grafana, and populate the Prometheus with data. Then access the Grafana UI to create and export a dashboard.