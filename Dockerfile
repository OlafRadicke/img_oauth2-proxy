FROM docker.io/library/alpine:3

ARG APP_VERSION=v7.5.1
ARG DOWNLOAD_URL=https://github.com/oauth2-proxy/oauth2-proxy/releases/download/${APP_VERSION}/oauth2-proxy-${APP_VERSION}.linux-amd64.tar.gz

RUN apk add curl
COPY bin/oauth2-proxy-v7.5.1.linux-amd64 /usr/local/bin/oauth2-proxy
RUN oauth2-proxy --version

USER 65532:65532

ENTRYPOINT ["/usr/local/bin/oauth2-proxy"]