if [ "$YASPI_SRC" = "bind" ]; then
    export PYTHONPATH="/hostpython:${DOLLAR}PYTHONPATH"
    export PATH="/hostpython/bin:${DOLLAR}PATH"
fi
yaspi --recipe=ray $ARGS
