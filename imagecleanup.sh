#!/bin/bash

#imgID=$(cat deployment.properties | grep imgid | grep -v grep | awk -F '=' '{print $2}')
sourceid=$(cat deployment.properties | grep generatedid | grep -v grep | awk -F '=' '{print $2}')

buildId=$(echo $sourceid | awk -F '-' '{print $3}')
prvbuildId=$((buildId - 1))

tag=$(echo $sourceid | cut -b 1-4)

tag=$tag$prvbuildId

echo "Image Tag Id: $tag"

echo "Previous Build Id: $prvbuildId"

imgId=$(sudo docker images maheshirala/sample:$tag | wc -l )
echo $imgId
if [ $imgId -gt 1 ]; then
   echo "Clean up previous build image $imgID"
   sudo docker rmi maheshirala/sample:$tag --force

else
   echo "Clean up previous build image $imgID"
   sudo docker rmi maheshirala/sample:$tag --force
   echo "No Images to delete."
fi
