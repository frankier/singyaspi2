#!/bin/bash

# This script is responsible for initialising a ray worker node on whichever
# machine slurm has assigned to it

# parse the arguments
PID=$$
address=$1
worker_id=$2

# Setup the environment for Ray
{{env_setup}}

# Launch the worker node
cmd="singularity exec \
    --nv $SING_EXTRA_ARGS $RAY_SIF_PATH \
    ray start --address=${address} {{ray_args}}"
echo "running cmd: ${cmd}"
eval $cmd

# Prevent the slurm scheduler from releasing the machine
sleep infinity
echo "Worker ${worker_id} stopped"
