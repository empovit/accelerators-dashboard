#!/bin/sh

set -e

CM_NAME=${CM_NAME:-accelerator-exporter-dashboard}
NAMESPACE=${NAMESPACE:-openshift-config-managed}
DASHBOARD_FILE=${DASHBOARD_FILE:-accelerators-dashboard.json}

echo "Trying to delete ConfigMap ${CM_NAME} in namespace ${NAMESPACE}"
oc delete configmap ${CM_NAME} -n ${NAMESPACE} --ignore-not-found

echo "Creating ConfigMap ${CM_NAME} from ${DASHBOARD_FILE} in namespace ${NAMESPACE}"
oc create configmap ${CM_NAME} -n ${NAMESPACE} --from-file="${DASHBOARD_FILE}"

echo "Enabling the dashboard in Administrator UI"
oc label configmap ${CM_NAME} -n ${NAMESPACE} "console.openshift.io/dashboard=true"

echo "Enabling the dashboard in Developer UI"
oc label configmap  ${CM_NAME} -n ${NAMESPACE} "console.openshift.io/odc-dashboard=true"
