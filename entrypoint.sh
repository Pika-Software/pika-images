#!/bin/sh
cd /home/container
echo "Docker image made by Retro#1593"

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`

# Run the Server
eval ${MODIFIED_STARTUP}