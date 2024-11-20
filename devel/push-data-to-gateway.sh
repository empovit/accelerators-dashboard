#!/bin/sh

set -e

cat <<EOF | curl --data-binary @- http://localhost:9091/metrics/job/pushgateway
  vendor_model:node_accelerator_cards:sum{vendor="NVIDIA", model="A100"} 2
  vendor_model:node_accelerator_cards:sum{vendor="AMD", model="A210"} 3
  vendor_model:node_accelerator_cards:sum{vendor="QUALCOMM", model="A100"} 1
EOF
