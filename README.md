# AWS ML batch pipeline starter
## Overview

Starter for end-to-end AWS serverless technology-based pipeline for a batch model, supporting ECS or Kubernetes for model execution, and Spark running on EMR for ETL.

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
| :white_check_mark: | Input and output stored in S3 |
| :white_check_mark: | Terraform for infrastructure management |
| :x: | Jenkins CI/CD pipeline |

## Setup

Prior to setting up the automated deployment pipeline, you need to setup Terraform so that it can used S3 for storage of shared state.

1. Install developer dependencies
    - Install [Terraform](https://www.terraform.io/downloads.html). (Tested with version `0.12.19`.)
    - (Optional) Install and configure [AWS CLI](https://aws.amazon.com/cli/). (Tested with version `1.16.304`.)
1. Manually create an S3 bucket, which will be used for storing Terraform state, as well as input and output data.
    - E.g., using AWS CLI:
    ```sh
    aws s3 mb s3://my-bucket --region us-east-1
    ```
1. Import the bucket to be under Terraform control
    1. Open terminal, and change directory: `cd storage/terraform`
    1. Initialize Terraform locally:
    ```sh
    terraform init \
        -backend-config="bucket=my-bucket" \
        -backend-config="region=us-east-1"
    ```
    1. Import the bucket you just created so that it is managed by Terraform:
    ```sh
    terraform import \
        -var="bucket=my-bucket" \
        -var="region=us-east-1" \
        aws_s3_bucket.bucket my-bucket
    ```
    1. (Optional) Confirm Terraform is correctly setup by running plan:
    ```sh
    terraform plan \
        -var="region=us-east-1" \
        -var="bucket=my-bucket"
    ```
    If successful, you'll see a view that shows which changes will be made. To apply them now:
    ```sh
    terraform apply -auto-approve \
        -var="region=us-east-1" \
        -var="bucket=my-bucket"
    ```
    1. (Optional) Confirm Terraform shared state was created within the bucket.
      - E.g., using AWS CLI:
      ```sh
      aws s3 ls s3://my-bucket/terraform/storage/terraform.tfstate
      ```

You now have an S3 bucket that will hold Terraform state that will be shared with anyone else working on your project.

It's time to setup CI/CD using Jenkins:

TODO

## Environment Variables
TODO

## Directory Structure

| Directory/File| Description |
| --- | --- |
| `storage/` | Manages S3 for input, outputs, and Terraform state management |
