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

### Install local developer dependencies

These are necessary for local development, and will also be necessary for doing some setup prior to configuring the CI/CD pipeline.

Note that our CI/CD pipeline will automatically install these dependencies in the worker nodes.

1. (Recommended) Install and configure [AWS CLI](https://aws.amazon.com/cli/). (Tested with version `1.16.304`.)
1. Install and configure [Terraform](https://www.terraform.io/downloads.html). (Tested with version `0.12.19`.)

### Create bucket for Terraform shared state storage

Prior to setting up the automated deployment pipeline, you need to setup Terraform so that it can used S3 for storage of shared state. This will enable everyone working on your project to contribute infrastructure changes.

Though the bucket will be managed by Terraform, it cannot be created by Terraform because Terraform is dependent on the shared state that will be stored in the bucket; it's a catch-22. The workaround is to first create the S3 bucket, then initialize Terraform (which creates the shared state at `terraform/storage/terraform.tfstate`), and afterwards manually import the bucket into Terraform.

1. Install developer dependencies

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
    1. (Recommended) Confirm Terraform is correctly setup by running plan:
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
    1. (Recommended) Confirm Terraform shared state was created within the bucket.
      - E.g., using AWS CLI:
        ```sh
        aws s3 ls s3://my-bucket/terraform/storage/terraform.tfstate
        ```

### Setup CI/CD using Jenkins

TODO

## Environment Variables
TODO

## Directory Structure

| Directory/File| Description |
| --- | --- |
| `storage/` | Manages S3 for input, outputs, and Terraform state management |
