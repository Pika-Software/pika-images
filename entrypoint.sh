#!/bin/sh
cd /home/container
echo "Docker image made by Retro#1593"

# Add library paths
export LD_LIBRARY_PATH=/home/container:/home/container/bin:/home/container/bin/linux32:/home/container/bin/linux64:/home/container/garrysmod/lua/bin

# Run the Server
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
eval ${MODIFIED_STARTUP}