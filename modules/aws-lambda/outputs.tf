output "text_to_speech_lambda" {
  value = {
    name       = aws_lambda_function.text_to_speech_lambda.function_name
    invoke_arn = aws_lambda_function.text_to_speech_lambda.invoke_arn
  }
  description = "Invoke ARN and name of text to speech lambda"
}

