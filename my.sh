#!/bash/sh
ssh -i $SSH_PRIVATE_KEY $SSH_USERNAME -o StrictHostKeyChecking=no
sudo docker kill $(sudo docker ps -q)