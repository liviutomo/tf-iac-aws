# Django Password Generator Web Application

## Overview
This Django web application, named "Password Generator", is a simple tool for generating strong and secure passwords. It provides users with the ability to customize password length and choose whether to include uppercase letters, lowercase letters, numbers, and special characters.

The application is containerized using Docker for easy deployment and scalability. The Docker image is pushed to Amazon Elastic Container Registry (ECR) and then deployed on an Amazon ECS (Elastic Container Service) cluster.

## Features
- Generate strong and secure passwords of variable length
- Customize password complexity by including or excluding uppercase letters, lowercase letters, numbers, and special characters
- Easy-to-use web interface

## Technologies Used
- Django: Python web framework for building the application
- Docker: Containerization for packaging the application and its dependencies
- Amazon ECR: Docker container registry for storing and managing Docker images
- Amazon ECS: Orchestrates and manages containers on a cluster of EC2 instances

## Deployment Instructions
1. Clone this repository to your local machine.
   ```bash
   git clone https://github.com/your-username/password-generator.git

2. Build the Docker image.
   ```bash
   docker build -t password-generator .

3. Tag the Docker image with the ECR repository URI.
   ```bash
   docker tag password-generator:latest <your-ecr-repository-uri>:latest

4. Login to Amazon ECR.
   ```bash
   aws ecr get-login-password --region <your-region> | docker login --username AWS --password-stdin <your-ecr-repository-uri>

5. Push the Docker image to Amazon ECR.
   ```bash
   docker push <your-ecr-repository-uri>:latest

6. Navigate to the ECS console on AWS and create a new ECS cluster.


7. Create a new task definition on ECS, specifying the Docker image from your ECR repository.


8. Configure the ECS service to use the task definition created in the previous step.


9. Access the web application by navigating to the public IP address or domain name associated with your ECS cluster.

## Contributing
Contributions are welcome! Please feel free to open a pull request or submit an issue with any improvements or suggestions.

## License
This project is licensed under the MIT License.
