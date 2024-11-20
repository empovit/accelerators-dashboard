#!/bin/sh

set -e

podman run -d --rm --net=host --name=prometheus \
    --security-opt label=disable \
    -v $(pwd)/prometheus.yml:/etc/prometheus/prometheus.yml \
    prom/prometheus

echo "Access Prometheus API at http://localhost:9090"