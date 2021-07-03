#!/bin/sh
cd /home/container
echo "Docker image made by Retro#1593"

# Add library paths
export LD_LIBRARY_PATH=./garrysmod/lua/bin:./bin:./bin/linux32:./bin/linux64

# Set rights for files
echo "Changing files rights..."
find . -type d -exec chmod 2770 {} \;
find . -type f -exec chmod 660 {} \;
chmod -R 770 ./bin 
chmod -f 770 ./srcds_linux
chmod -f 770 ./srcds_run
chmod -f 770 ./srcds_run_x64

# Run the Server
echo "Starting server..."
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
eval ${MODIFIED_STARTUP}