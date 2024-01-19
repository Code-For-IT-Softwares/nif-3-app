#!/bin/sh

#set port
PORT=5050

# Stop any program currently running on the set port
echo 'preparing port' $PORT
fuser -k 5050/tcp

#switch directories
cd ./build/web/

#start the server
echo 'server starting on port '$PORT
python3 -m http.server $PORT