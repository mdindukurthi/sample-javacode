#!/bin/bash
imgID=$(docker images | grep maheshirala/sample | awk '{print $3}')
echo "Clean up previous build image $imgID"

if [ -z "$imgID" ]; then
   echo "No Images to delete."
else
   docker rmi $imgID
fi
