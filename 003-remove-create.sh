#!/bin/bash

# Check if an argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 {create-container|remove-container}"
    exit 1
fi

ACTION=$1

if [ "$ACTION" = "remove-container" ]; then
    # Remove all containers by name
    containers=$(docker ps -a --format '{{.Names}}')
    if [ -z "$containers" ]; then
        echo "No containers to stop/remove."
        exit 0
    fi

    for container in $containers; do
        echo "Stopping container: $container"
        docker stop "$container"

        echo "Removing container: $container"
        docker rm "$container"
    done

    echo "All containers stopped and removed."
    echo "Remaining containers:"
    docker ps -a --format '{{.Names}}'

elif [ "$ACTION" = "create-container" ]; then
    # Number of containers to create, you can change it here
    N=5

    for i in $(seq 1 $N); do
        name="c$i"
        echo "Creating container: $name"
        docker run --name "$name" -itd ubuntu /bin/bash
    done

    echo "Containers created:"
    docker ps -a --format '{{.Names}}'

else
    echo "Invalid argument: $ACTION"
    echo "Usage: $0 {create-container|remove-container}"
    exit 1
fi


--------------------------

How to use:
bash
Copy
Edit
chmod +x script.sh
./script.sh create-container     # to create c1..c5 containers
./script.sh remove-container     # to stop and remove all containers
Explanation:
Checks for argument count and value.

If remove-container passed: stops and removes all containers by name.

If create-container passed: creates containers named c1 to c5.
