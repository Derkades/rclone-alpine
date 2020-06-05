FROM alpine

# RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" > /etc/apk/repositories && \
#     apk add --no-cache rclone

RUN OS_type="`uname -m`" && \
    case $OS_type in \
    x86_64|amd64) \
        OS_type='amd64' \
        ;; \
    i?86|x86) \
        OS_type='386' \
        ;; \
    arm*) \
        OS_type='arm' \
        ;; \
    aarch64) \
        OS_type='arm64' \
        ;; \
    *) \
        echo 'OS type not supported' \
        exit 2 \
        ;; \
    esac && \
    mkdir -p /downloads && cd /downloads && \
    wget -O download.zip "https://downloads.rclone.org/rclone-current-linux-$OS_type.zip" && \
    unzip download.zip && \
    mv rclone-*/rclone /usr/bin/rclone && \
    cd / && rm -rf /downloads && \
    rclone --version

CMD [ "/usr/bin/rclone" ]
