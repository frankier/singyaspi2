#!/bin/bash

# This script is responsible for initialising the ray head node on whichever
# machine slurm has assigned to it

# Setup the environment for Ray
echo "setting up environment for ray head node"
{{env_setup}}

# Launch the head node
cmd="singularity exec \
    --nv $SIF_PATH $SING_EXTRA_ARGS \
    ray start --head --redis-port=6379 --include-webui {{ray_args}}"
echo "running cmd: ${cmd}"
eval $cmd

# Prevent the slurm scheduler from releasing the machine
sleep infinity
echo "Ray head node was stopped"
