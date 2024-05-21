variable "region" {
  type        = string
  description = "Type region name to create resources them"
}

variable "api_gateway_name" {
  type        = string
  description = "Name of text to speech gateway"
}
variable "lambda_name" {
  type        = string
  description = "Name of text to speech lambda"
}

variable "polly_voice_id" {
  type        = string
  description = "Voice id for Polly service"
}

variable "polly_language_code" {
  type        = string
  description = "Language codes availables in AWS Polly"
}


