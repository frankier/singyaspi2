export SINGULARITYENV_SIF_PATH="$SIF_PATH"

if [ -z "$YASPI_SRC" ]; then
    YASPI_SRC="sif"
fi

if [ "$YASPI_SRC" == "bind" ]; then
    SING_EXTRA_ARGS="--bind $SCRIPTPATH/python:/hostpython"
elif [ "$YASPI_SRC" == "sif" ]; then
    SIF_PATH="$SCRIPTPATH/yaspi.sif"
    if [ ! -f "$SIF_PATH" ]; then
        pushd $SCRIPTPATH
        singularity pull yaspi.sif docker://ghcr.io/frankier/yaspi:latest
        popd
    fi
fi
