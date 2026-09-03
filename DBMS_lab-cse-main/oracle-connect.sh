#!/bin/bash

gnome-terminal -- bash -c '
echo "Checking Oracle XE Docker container..."
sudo docker ps

echo ""
echo "Connecting to Oracle XE..."
sudo docker exec -it oracle-xe sqlplus system/ifet@localhost:1521/XEPDB1

echo ""
echo "Press Enter to close..."
read
'
