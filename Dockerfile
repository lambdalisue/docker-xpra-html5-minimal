FROM ghcr.io/lambdalisue/xpra-minimal

LABEL org.opencontainers.image.url https://github.com/users/lambdalisue/packages/container/package/xpra-html5-minimal
LABEL org.opencontainers.image.source https://github.com/lambdalisue/docker-xpra-html5-minimal

# skip interactive configuration dialogs
ENV DEBIAN_FRONTEND noninteractive

# add winswitch repository and install Xpra
RUN apt-get update && \
    apt-get install -y --no-install-recommends xpra-html5 python3-requests && \
    rm -rf /var/lib/apt/lists/*

# copy xpra config file
COPY ./xpra.conf /etc/xpra/xpra.conf

# set default password
ENV XPRA_PASSWORD xpra

# expose xpra HTML5 client port
EXPOSE 14500
