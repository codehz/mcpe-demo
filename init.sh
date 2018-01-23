#!/bin/sh
cd /root/app
cp -r /data/assets/* .
ln -s . assets
mkdir -p libs
cp /data/lib/x86/libminecraftpe.so libs
cp ../server .
mkdir -p games
touch games/server.properties
ln -s games/server.properties .
exec ./server
