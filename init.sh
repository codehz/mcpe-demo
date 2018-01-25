#!/bin/sh
cd /root/app
touch games/server.properties
mkdir games/mods -p
ln -s games/server.properties .
ln -s games/mods .
exec ./server
