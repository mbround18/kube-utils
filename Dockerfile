FROM alpine:20210804

COPY ./entrypoint.sh /entrypoint.sh
RUN apk add bash coreutils curl bind-tools grep nano && \
    wget -qO- https://getcroc.schollz.com | bash && \
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/ && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]