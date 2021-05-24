#!/bin/sh -
set -m
export templdpath=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH
export SteamAppId=892970

echo "Updating application"
/usr/games/steamcmd +login anonymous +force_install_dir /valheim +app_update 896660 +quit

echo "Starting server PRESS CTRL-C to exit"

# Tip: Make a local copy of this script to avoid it being overwritten by steam.
# NOTE: Minimum password length is 5 characters & Password cant be in the server name.
# NOTE: You need to make sure the ports 2456-2458 is being forwarded to your server through your local router & firewall.
./valheim_server.x86_64 -name $WORLD_NAME -port 2456 -password $WORLD_PASSWORD -public 1 -savedir /valheim

export LD_LIBRARY_PATH=$templdpath
