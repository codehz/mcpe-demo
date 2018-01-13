#!/bin/sh
cd /root/app
if [ ! -f /root/app/server ]; then
  cp -r /data/assets/* .
  ln -s . assets
  mkdir -p libs
  cp /data/lib/x86/libminecraftpe.so libs
  cp ../server .
fi
exec ./server
