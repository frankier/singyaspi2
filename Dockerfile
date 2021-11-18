FROM python:3.10-slim

ADD yaspi /yaspi
RUN rm -rf /yaspi/yaspi/templates/ray
ADD singray /yaspi/yaspi/templates/ray
RUN pip install --no-deps -e /yaspi && \
    pip install beartype && \
    mkdir -p /usr/local/lib/python3.10/site-packages/watchlogs/ && \
    touch /usr/local/lib/python3.10/site-packages/watchlogs/__init__.py && \
    echo 'class Watcher: pass' > \
      /usr/local/lib/python3.10/site-packages/watchlogs/watchlogs.py

ENTRYPOINT ["yaspi"]
