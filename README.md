# WordPress Docker Boilerplate
This project provides a boilerplate for running WordPress in a Dockerized environment, with support for AWS ECR and ECS deployment, ensuring a scalable and secure production setup.

## Features
* Dockerized WordPress environment
* Easy integration with AWS ECR and ECS
* Secure secrets management using AWS Secrets Manager
* Support for multiple environments (development, QA, production) convention to build and push to ECR

## Prerequisites
* Docker and Docker Compose
* Makefile

## Local Development Setup
1. **Clone the repository**
    ```bash
    git clone git@github.com:indranandjha1993/wpContainer.git
    cd wpContainer
   ```
2. **Build and run Docker containers**
   ```bash
   make start
    ```
   _Run *make help* to find other available cmd_
3. **Access WordPress**

   `Open [http://localhost:8000](http://localhost:8000) in your web browser to configure and access your WordPress site.`

4. **Access PHPMyAdmin at** [http://localhost:8080](http://localhost:8080)
## Configuration
* Update docker-compose.yml with your specific configurations if necessary.
* Store sensitive information like database credentials in AWS Secrets Manager and reference them in your ECS task definition.

## CI/CD with GitHub Actions
* The **.github/workflows-files** directory contains the CI/CD pipeline configuration for building the Docker image and pushing it to AWS ECR, you just need to copy **workflow-files** to **workflows**.
* Update the GitHub Actions workflow file to match your AWS configuration and ECR repository. 

## Deploying to AWS ECS
1. **Push your Docker image to AWS ECR**
   The GitHub Actions workflow is set up to build and push the image to AWS ECR on a push to specific branches.
2. **Set up AWS ECS Task Definition**
   Refer to the secrets in AWS Secrets Manager in your ECS task definition to securely pass environment variables like DB credentials to your Docker container.Refer to the secrets in AWS Secrets Manager in your ECS task definition to securely pass environment variables like DB credentials to your Docker container.
3. **Run the ECS Task**
   Use the AWS Management Console or AWS CLI to run your ECS task based on the task definition.
4. **Secrets Management**
* Use AWS Secrets Manager to securely manage and access sensitive configuration data.
* Configure the ECS task definition to use these secrets.
