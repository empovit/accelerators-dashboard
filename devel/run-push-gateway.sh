#!/bin/sh

set -e

podman run -d --rm --net=host --name=push-gateway prom/pushgateway
echo "Push gateway endpoint: http://localhost:9091"