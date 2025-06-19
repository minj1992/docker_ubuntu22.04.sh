#!/bin/bash
N=5

for i in $(seq 1 $N); do
        name="c$i"
        echo "creating container: $name"
docker run --name "$name" -itd ubuntu /bin/bash

done

echo "container list is below"
echo "$(docker ps -a --format '{{.Names}}')"
