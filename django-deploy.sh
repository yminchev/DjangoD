#!/bin/bash

docker stop django
docker rm django
docker run -d -p 8000:8000 yminc.com:5000/mydjango:latest