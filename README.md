# devops
  This project run on MacOS
  #### Prerequisite
    - Install DockerDesktop
    - Install Terraform

## Step 1
  #### Add Dockerfile to containerize the app and support multiple environments
  docker build  -t node-app:v1.0 .

  docker run -p 3000:3000 -e NODE_ENV=dev node-app:v1.0 --name node-app-container

## Step 2
  #### Add docker-compose.yml file to set up the graphite and statsd

## Step 3
  #### Use Terraform to prepare the infrastructure