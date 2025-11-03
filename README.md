# TeamSpeak 6 Server (x86-64) for ARM
This is a fork of https://codeberg.org/Indogermane/teamspeak6-server-arm. Thanks to him.

The goal here is to auto-update image based on Official Teamspeak repository.

Run the official TeamSpeak 6 x86-64 server binary on 64-bit ARM hardware (Raspberry Pi 4, Apple Silicon, cloud ARM instances, …) using a minimal Debian-based Docker image and Box64 emulation.

The image is also available on Docker Hub: https://hub.docker.com/r/fezlight/teamspeak6-server-arm

## How to use

```yml
services:
  teamspeak:
    image: fezlight/teamspeak6-server-arm:latest
    restart: unless-stopped
    ports:
      - "9987:9987/udp"    # Voice
      - "30033:30033/tcp"  # File transfer
      - "10080:10080/tcp"  # Web query (optional)
    volumes:
      - ./data:/data       # full access to server files & database
    environment:
      - TSSERVER_LICENSE_ACCEPTED=accept
```
