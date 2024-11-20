#!/bin/sh

set -e

podman run --net=host -d --rm --name=grafana grafana/grafana-enterprise:6.7.6
echo "Access Grafana at http://localhost:3000"
echo "Username: admin, password: admin"