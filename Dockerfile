FROM alpine:3.2

RUN apk update && \
    apk add bash python py-pip wget && \
    pip install cfn-pyplates && \
    mkdir /cfn && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/*

WORKDIR /cfn
