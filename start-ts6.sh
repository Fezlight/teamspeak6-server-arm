#!/bin/bash
IMG_DIR=/opt/teamspeak

# Copy database (failing from TeamSpeak itself)
cp -r $IMG_DIR/sql /data

exec box64 /opt/teamspeak/tsserver "$@"
