FROM python:3.9-slim

ADD yaspi /yaspi
RUN rm -rf /yaspi/yaspi/templates/ray
ADD singray /yaspi/yaspi/templates/ray
RUN pip install --no-deps -e /yaspi && \
    pip install beartype && \
    pip install https://github.com/frankier/watchlogs/archive/refs/heads/no-numpy.zip

ENTRYPOINT ["yaspi"]
