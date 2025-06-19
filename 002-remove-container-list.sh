#!/bin/bash

containers=$(docker ps -a --format '{{.Names}}')
for container in $containers; do
        echo "stop the container : $container"
        docker stop $container
        echo "remove the container: $container"
        docker remove $container

done

echo "completed:"
echo "list of container is below.."
echo "$containers"
