#!/bin/sh

while true; do
if [ -e stop ]; then
  echo Stopping
  exit 0
fi
docker run -it -p 25565:25565 -v /data:/data minecraft:1.14.2
sleep 20s
done
