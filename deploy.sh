#!/bin/bash

# Server details
SERVER_IP="34.203.226.187"
SERVER_USERNAME="ubuntu"
APP_IMAGE="deepikajag/dev:lts"
APP_CONTAINER_NAME="your-app-container-name"
APP_PORT=3000  # Change this to the port your app listens on inside the container

# Pull Docker image from Docker Hub on the server
ssh $SERVER_USERNAME@$SERVER_IP "docker pull $APP_IMAGE"

# SSH into the server and run the Docker container
ssh $SERVER_USERNAME@$SERVER_IP << EOF
  # Stop and remove the existing container (if any)
  docker stop $APP_CONTAINER_NAME || true
  docker rm $APP_CONTAINER_NAME || true

  # Run the new container
  docker run -d -p $APP_PORT:80 --name $APP_CONTAINER_NAME $APP_IMAGE
EOF

echo "Deployment complete!"
