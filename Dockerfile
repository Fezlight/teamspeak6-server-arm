FROM debian:stable-slim
EXPOSE 9987/udp 30033/tcp 10080/tcp
WORKDIR /opt/teamspeak

ARG VERSION=v6.0.0-beta6

RUN apt-get update && \
      apt-get install -y --no-install-recommends ca-certificates wget gnupg libatomic1 && \
      apt-get update && \
      rm -rf /var/lib/apt/lists/*

# Download and extract TeamSpeak server
RUN PATH_VERSION=$(echo $VERSION | sed "s'-'%2F'g") && \
      wget "https://github.com/teamspeak/teamspeak6-server/releases/download/$PATH_VERSION/teamspeak6-server-linux-arm64.tar.xz" -O ts.tar.xz && \
      tar -xJf ts.tar.xz --strip-components=1 && \
      rm ts.tar.xz && \
      chmod +x tsserver

# Copy start script into container
COPY --chmod=0755 start-ts6.sh /usr/local/bin/start-ts6.sh

WORKDIR /data

# Execute start script
ENTRYPOINT ["/usr/local/bin/start-ts6.sh"]
