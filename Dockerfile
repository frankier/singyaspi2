FROM python:3.10-slim

ADD yaspi /yaspi
RUN rm -rf /yaspi/yaspi/templates/ray
ADD singray /yaspi/yaspi/templates/ray
RUN pip install --no-deps -e /yaspi && \
    pip install beartype && \
    mkdir -p /yaspi/yaspi/watchlogs/ && \
    touch /yaspi/yaspi/watchlogs/__init__.py \
    echo "class Watcher: pass" > /yaspi/yaspi/watchlogs/watchlogs.py

ENTRYPOINT ["yaspi"]
