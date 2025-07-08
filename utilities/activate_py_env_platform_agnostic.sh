#!/bin/bash

activate_py_env_platform_agnostic() {

    local DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

    source $DIR/are_we_in_cluster.sh

    # Use the is_cluster function
    if on_cluster; then
        echo "we are on cluster"
        source $DIR/activate_py_env_cluster.sh
        activate_py_env_cluster
    else
        source $DIR/activate_py_env.sh
        activate_py_env
    fi

}