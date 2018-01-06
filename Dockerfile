FROM alpine:latest
LABEL maintainer="nigel@nwlnexus.com"
LABEL description="Docker container used to build Hugo(SSG) sites."
LABEL version="1.0"

RUN apk add --update \
    git \
    python \
    py-pip \
  && pip install pygments \
  && rm -rf /var/cache/apk/*

ENV HUGO_VERSION 0.32.2
ENV HUGO_BINARY hugo
ENV HUGO_RESOURCE hugo_${HUGO_VERSION}_Linux-64bit

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_RESOURCE}.tar.gz /tmp

RUN mkdir -p /tmp/hugo \
    && tar -xvzf /tmp/${HUGO_RESOURCE}.tar.gz -C /tmp/hugo \
	&& mv /tmp/hugo/${HUGO_BINARY} /usr/bin/hugo \
    && rm -rf /tmp/hugo*