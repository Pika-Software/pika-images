#!/bin/sh
cd /home/container
echo "Docker image made by Retro#1593"
java -version

# Run the Server
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
eval ${MODIFIED_STARTUP}