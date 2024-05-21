variable "region" {
  type        = string
  description = "Type region name to create resources them"
  validation {
    condition = contains([
      "us-east-1",
      "us-east-2",
      "us-west-1",
      "us-west-2",
      "af-south-1",
      "ap-east-1",
      "ap-south-1",
      "ap-northeast-1",
      "ap-northeast-2",
      "ap-northeast-3",
      "ap-southeast-1",
      "ap-southeast-2",
      "ap-southeast-3",
      "ca-central-1",
      "eu-central-1",
      "eu-west-1",
      "eu-west-2",
      "eu-west-3",
      "eu-north-1",
      "eu-south-1",
      "eu-south-2",
      "me-south-1",
      "me-central-1",
      "sa-east-1"
    ], var.region)
    error_message = "Invalid region. Please select a valid AWS region."
  }
}

variable "api_gateway_name" {
  description = "Name of text to speech gateway"
}
variable "lambda_name" {
  description = "Name of text to speech lambda"
}



