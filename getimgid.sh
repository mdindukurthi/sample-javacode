#!/bin/bash
imgID=$(sudo docker images | grep maheshirala/sample | awk '{print $3}')

if [ -z "$imgID" ]; then
   echo "No Images to store."
else
   echo "\n" >> deployment.properties
   echo "imgid=$imgID" >> deployment.properties
fi

