output "api_gateway_deployment_invoke_url" {
  description = "Url to send request."
  value       = "${aws_api_gateway_stage.rest_api_deployment_stage.invoke_url}/convert"
}
