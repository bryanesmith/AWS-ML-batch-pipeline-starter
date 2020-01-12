# AWS ML batch pipeline starter
## Overview

Starter for AWS serverless-based pipeline for a batch model, supporting ECS or Kubernetes for model execution, and Spark running on EMR for ETL.

With the infrastructure automatically provisioned using IaC and CI/CD, you provide an implementation of the model, ETL, and validation using starter code, and changes will automatically deploy to your cluster.

## Features
| Status | Description |
| :---: | ---|
| :x: | AWS Step Function-based orchestration |
| :x: | Lambda stubs for input and output validation |
| :x: | CloudWatch-based scheduled events for execution |
| :x: | Dockerized model execution in ECS |
| :x: | Dockerized model execution in EKS |
| :x: | ETL using Spark on EMR |
| :x: | Input and output stored in S3 |
| :x: | Terraform for infrastructure management |
| :x: | Jenkins CI/CD pipeline |

## Environment Variables
TODO
