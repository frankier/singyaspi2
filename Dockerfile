FROM python:3.10-alpine

RUN apk add --no-cache bash
ADD yaspi /yaspi
RUN rm -rf /yaspi/yaspi/templates/ray
ADD singray /yaspi/yaspi/templates/ray
RUN pip install -e /yaspi 

ENTRYPOINT ["yaspi"]
