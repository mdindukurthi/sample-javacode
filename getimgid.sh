#!/bin/bash
imgID=$(sudo docker images | grep maheshirala/sample | awk '{print $3}')
echo "\n" >> deployment.properties
echo "imgid=$imgID" >> deployment.properties 
