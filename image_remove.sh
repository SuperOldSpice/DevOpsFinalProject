#!/bin/sh
let "LAST_BUILD = ${env.BUILD_NUMBER}"
let "LAST_BUILD--"
sudo docker rmi -f $(sudo docker images -q $DOCKERHUB_CREDENTIALS_USR/myapp:$GIT_BRANCH-"$LAST_BUILD"
