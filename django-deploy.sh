#!/bin/bash

if [ $1 ];
then
  CNAME=$1
else
  CNAME='django'
fi

if [ $2 ];
then
  INAME=$2
else
  INAME='yminc.com:5000/mydjango:latest'
fi

echo "Stopping old container $CNAME..."
docker stop $CNAME

echo "Removing old container $CNAME..."
docker rm $CNAME

echo "Starting a new container $CNAME from $INAME..."
docker run -d -p 8000:8000 --name=$CNAME $INAME 
