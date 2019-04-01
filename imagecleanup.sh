#!/bin/bash

imgID=$(cat deployment.properties | grep imgid | grep -v grep | awk -F '=' '{print $2}')

if [ -z "$imgID" ]; then
   echo "No Images to delete."
else
   echo "Clean up previous build image $imgID"
   sudo docker rmi $imgID
fi
