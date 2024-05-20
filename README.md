# Deply Django Web Application on AWS with Terraform

## Overview
This Django web application, named "Password Generator", is a simple tool for generating strong and secure passwords. It provides users with the ability to customize password length and choose whether to include uppercase letters, lowercase letters, numbers, and special characters.

The application is containerized using Docker for easy deployment and scalability. The Docker image is pushed to Amazon Elastic Container Registry (ECR) and then deployed on an Amazon ECS (Elastic Container Service) cluster.

This project demonstrates the deployment of a Django web application on AWS using Terraform. It provides a comprehensive guide on configuring various AWS products and services using Terraform scripts.

## Diagram of this project

![Cloud Architecture](https://github.com/liviutomo/tf-iac-aws/assets/37658762/aaa21c00-5b8f-46c8-9dfc-46699916f14d)

## Features
- Generate strong and secure passwords of variable length
- Customize password complexity by including or excluding uppercase letters, lowercase letters, numbers, and special characters
- Easy-to-use web interface

## Technologies Used
- Django: Python web framework for building the application
- Docker: Containerization for packaging the application and its dependencies
- Terraform: Infrastructure as Code (IaC) tool that allows you to build, change, and version infrastructure safely and efficiently
- Amazon ECR: Docker container registry for storing and managing Docker images
- Amazon ECS: Orchestrates and manages containers on a cluster of EC2 instances

## AWS Products Configured
###### ECR (Elastic Container Registry): Docker images for the Django application will be stored here.
###### Networking:
   - VPC (Virtual Private Cloud): Provides an isolated network environment.
   - Public and Private Subnets: Segregation of resources for better security and accessibility.
   - Routing Tables: Directs traffic between subnets and the internet.
   - Internet and NAT Gateways: Enable communication between instances in the VPC and the internet.
###### Load Balancer
   - Listener: Listens for incoming traffic on specified ports.
   - Target Groups: Route requests to registered targets (ECS instances in this case).
###### Security Groups
   - Define firewall rules for controlling traffic to instances.
###### ECS (Elastic Container Service)
   - Cluster: Group of container instances running together.
   - Task Definition: Defines the containers that run together as a single task.
   - Service: Ensures that the specified number of tasks are running and maintains their desired state.
###### IAM (Identity and Access Management)
   - Roles and Policies: Define permissions for services and resources within AWS.
## Deployment Instructions
1. Clone this repository to your local machine.
   ```bash
   git clone https://github.com/liviutomo/tf-iac-aws.git

2. Create and Run the application locally.
   ```bash
   $ python3.10 -m venv env
   $ . ./env/bin/activate -> for Linux distribution
   $ ./env/Scripts/activate -> Windows distribution
   (venv) $ pip install -r requirements.txt
   (venv) $ django-admin startproject password_generator .
   (venv) $ python ./manage.py migrate
   (venv) $ python ./manage.py runserver

- Check if the application runs properly by accessing localhost: http://127.0.0.1:8000. Ensure that Django is running, and kill the development server.

3. Dockerize the application and test it's functionality.
   ```bash
   docker build -t password-generator .
   docker run -p 8000:8000 django-aws-backend gunicorn -b 0.0.0.0:8000 password-generato.wsgi:application
   
- Go to the http://127.0.0.1:8000 page and verify that we successfully build and run the docker image with a Django application.
   
4. Login to Amazon ECR.
   ```bash
   aws ecr get-login-password --region <your-region> | docker login --username AWS --password-stdin <your-ecr-repository-uri>

5. Ensure you have Terraform installed on your machine.

6. Modify the Terraform scripts (*.tf) as per your requirements.

7. Run 'terraform init' to initialize the working directory.

8. Run 'terraform plan' to see the execution plan.

9. Run 'terraform apply' to apply the changes and deploy the infrastructure on AWS.

10. You should see your ALB domain in output.
      ```bash
      prod_lb_domain = "prod-1595141363.eu-north-1.elb.amazonaws.com"
   Please check the Load Balancer domain in a browser to ensure our setup works.


## Github Workflow
This GitHub Actions pipeline '.github/workflows/deploy-docker-image-to-ecr.yml' automates the build, push, and deployment of a Docker image to Amazon ECR and Amazon ECS. It triggers on pushes to the main branch, first building and pushing the Docker image to Amazon ECR, and then deploying the updated image to an ECS service. It utilizes AWS credentials securely stored in GitHub secrets and employs the AWS CLI for authentication and deployment tasks.


## Contributing
Contributions are welcome! Please feel free to open a pull request or submit an issue with any improvements or suggestions.

## License
This project is licensed under the MIT License.
