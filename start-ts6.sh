#!/bin/bash
IMG_DIR=/opt/teamspeak

# Copy database (failing from TeamSpeak itself)
cp -r $IMG_DIR/sql /data

/opt/teamspeak/tsserver "$@"
