FROM debian:stable-slim
EXPOSE 9987/udp 30033/tcp 10080/tcp
WORKDIR /opt/teamspeak

ARG VERSION=v6.0.0-beta6

# Install Box64 from ryanfortner (https://github.com/ryanfortner/box64-debs)
RUN apt-get update && \
      apt-get install -y --no-install-recommends ca-certificates wget bzip2 gnupg libatomic1 && \
      wget https://ryanfortner.github.io/box64-debs/box64.list -O /etc/apt/sources.list.d/box64.list && \
      wget -qO- https://ryanfortner.github.io/box64-debs/KEY.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/box64-debs-archive-keyring.gpg && \
      apt-get update && \
      apt-get install -y box64 && \
      rm -rf /var/lib/apt/lists/*

# Download and extract TeamSpeak server
RUN PATH_VERSION=$(echo $VERSION | sed "s'-'%2F'g") && \
      wget "https://github.com/teamspeak/teamspeak6-server/releases/download/$PATH_VERSION/teamspeak-server_linux_amd64-$VERSION.tar.bz2" -O ts.tar.bz2 && \
      tar -xjf ts.tar.bz2 --strip-components=1 && \
      rm ts.tar.bz2 && \
      chmod +x tsserver

# Copy start script into container
COPY --chmod=0755 start-ts6.sh /usr/local/bin/start-ts6.sh

WORKDIR /data

# Execute start script
ENTRYPOINT ["/usr/local/bin/start-ts6.sh"]
