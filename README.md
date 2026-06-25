# (DEPRECATED) TeamSpeak 6 Server (x86-64) for ARM

## :rotating_light: Teamspeak 6 now have its own image with ARM native support, please use it, see [Teamspeak 6](https://hub.docker.com/r/teamspeaksystems/teamspeak6-server/tags)

Teamspeak has released the new version 6.0.0-beta9, which now natively supports ARM, meaning that QEMU is no longer required to emulate the ARM architecture (see https://github.com/teamspeak/teamspeak6-server/releases/tag/v6.0.0-beta9). 

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
