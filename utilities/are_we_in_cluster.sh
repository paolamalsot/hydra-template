#!/bin/bash

# Get the hostname
HOSTNAME=$(hostname)

## TODO: replace this with the name of your cluster
on_cluster() {
    local HOSTNAME=$(hostname)
    if [[ "$HOSTNAME" == *"cluster"* ]]; then
        return 0  # Success: We are on a cluster (biomed or euler)
    else
        return 1  # Failure: Not on a cluster
    fi
}