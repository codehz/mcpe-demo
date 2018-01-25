#!/bin/sh
echo Starting...
mkdir /data
unzip /game.zip -d /data > /dev/null
echo Unzipped
mkdir -p /app/libs
mkdir -p /app/resource_packs/vanilla
cd /app
mv /data/assets/resource_packs/vanilla/*.json resource_packs/vanilla/
mv /data/assets/behavior_packs .
mv /data/assets/definitions .
mv /data/assets/structures .
mv /data/lib/x86/libminecraftpe.so libs
ln -s . assets
rm -rf /data
echo Finished
