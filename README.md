#k8s-practice

This is a repository for practicing kubernetes.

## Terraform

Terraform folder contains terraform files for creating a kubernetes cluster on AWS. Change variables and run the following commands:

    terraform init
    terraform plan
    terraform apply

## Pipelines

app.yml contains test,build and deploy jobs. It is used for building and deploying the application to Kubernetes cluster.

Test job uses SonarQube, hadolint and runs unit tests. Build job builds the docker image and pushes it to docker hub. Deploy job deploys the application to Kubernetes cluster. After deploying the application, it waits for 30 seconds and then checks the application health with cypress.