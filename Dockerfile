FROM alpine:3.16
MAINTAINER "Patrick Hensley <pathensley@gmail.com>"
ADD requirements.txt .
RUN apk add --update python3 py3-pip py3-gevent && \
    pip install -r requirements.txt && \
    apk del py3-pip && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/*
ADD dockerdns .
EXPOSE 53
ENTRYPOINT ["./dockerdns"]
