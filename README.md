# singyaspi2 = Ray + Yaspi + Singularity + SLURM

This profile configures Ray installed within a Singularity container to run on
the [SLURM Workload Manager](https://slurm.schedmd.com/) via Yaspi.

The project integrates [YASPI's Ray support](https://github.com/albanie/yaspi)
and [singreqrun](https://github.com/frankier/singreqrun).

## Running

Installation is performed by [download a packaged
release](https://github.com/frankier/singyaspi2/releases/) and then unzipping
it.

Assuming the latest release is `$VERSION`, you can run:

    $ cd ~
    $ wget https://github.com/frankier/singslurm2/releases/download/$VERSION/singyaspi.pkg.zip
    $ unzip singyaspi.pkg.zip

After performing these steps the entrypoint is `~/singyaspi/entrypoint.sh`.
Arguments are passed using environment variables. Compulsory arguments are
shown in **bold**:

 * Options relating to Singularity:
   * **`$SIF_PATH`**: Path to Singularity SIF file within which both the
     head node and the execution of the worker nodes will occur on the
     cluster
   * `$YASPI_SRC`: Where to get yaspi from. By default this is `sif` which will
     download a Singularity image with yaspi in for you. You can also specify
     `monolithic` if you have installed yaspi into your own SIF.
   * `SING_EXTRA_ARGS`: Extra arguments to pass to `singularity exec` and
     `singularity shell`. Most often you might use this to pass in extra
     `--bind` commands.
 * Other options:
   * `$TRACE`: Trace the script -- useful for debugging
   * `$PRE_COORDINATOR_SCRIPT` and `$PRE_JOB_SCRIPT`: script fragments, typically
     setting or modifying environment variables, which will run at the
     beginning of the coordinator and job processes respectively. See
     *Customisation for different cluster environments* for typical usage.

Anything passed as an actual arguments to `entrypoint.sh` will be passed to
yaspi running within the container.

```
~/singyaspi/entrypoint.sh \
      --job_name=example \
      --cmd="$command" \
      --job_array_size=3 \
      --cpus_per_task=2 \
      --gpus_per_task=1 \
      --mem=10G \
      --recipe=ray
```

## More information

More information can be found from [yaspi](https://github.com/albanie/yaspi)
and [singreqrun](https://github.com/frankier/singreqrun).
