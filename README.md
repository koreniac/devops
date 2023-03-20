# devops
  This project run on MacOS
  #### Prerequisite
    - Install DockerDesktop
    - Install Terraform

## Step 1
  #### Add Dockerfile to containerize the app and support multiple environments
  #### try to build and run dev
    docker build  -t node-app:v1.0 .

    docker run -p 3000:3000 -e NODE_ENV=dev node-app:v1.0 --name node-app-container

## Step 2
  #### Add compose.yml file to set up the graphite and statsd
  - start service
        docker compose up
  - stop service
        docker compose down


## Step 3
  #### Use Terraform to prepare the infrastructure
  - start service
        terraform init
        terraform apply
          and type "yes" for confirm
  - stop service
        terraform destroy