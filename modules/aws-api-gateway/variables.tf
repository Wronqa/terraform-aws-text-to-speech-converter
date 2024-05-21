variable "region" {
  description = "Region of AWS Service"
}
variable "text_to_speech_lambda" {
  type = object({
    invoke_arn = string
    name       = string
  })
  description = "Invoke ARN and name of text to speech lambda"
}
variable "api_gateway_name" {
  description = "Name of text to speech gateway"
}
