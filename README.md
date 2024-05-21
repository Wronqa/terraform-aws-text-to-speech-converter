# Terraform AWS Text-to-Speech Converter

This project sets up an infrastructure to convert text files to speech using AWS services. It employs Terraform to provision the necessary resources.

## Table of Contents
- [Features](#features)
- [Technologies](#technologies)
- [Installation](#installation)
- [Architecture](#architecture)
- [Additional Information](#additional-information)

## Features
- Convert passed text to speech.
- Download converted text as an MP3 file.

## Technologies
- **Infrastructure as Code**: Terraform
- **Cloud Services**: AWS
  - API Gateway
  - AWS Lambda (Python)
- **Programming Languages**: Python (for AWS Lambda)

## Installation
1. **Configure AWS ACCOUNT**:
    ```bash
    aws configure
    ```
2. **Fill in the variables in the `terraform.tfvars` file**:
    ```hcl
    region                 = "YOUR_AWS_REGION"
    api_gateway_name       = "API_GATEWAY_NAME"
    lambda_name            = "LAMBDA_NAME"

    polly_voice_id         = "POLLY_VOICE_ID"
    polly_language_code    = "POLLY_LANGUAGE_CODE"
    ```
3. **Initialize and apply Terraform**:
    ```bash
    terraform init
    terraform apply
    ```

## Architecture
![Architecture Diagram](https://i.imgur.com/U2dFxMc.png)

**Architecture Description:**
- The user sends text data via API Gateway
- API Gateway triggers a Lambda function.
- The Lambda function uses AWS Polly to convert the text to speech.
- The converted MP3 file is returned to the user.


**AWS Services Used:**
- API Gateway
- AWS Lambda

## Additional Information
- **Authors**: Wronqa
- **License**: MIT