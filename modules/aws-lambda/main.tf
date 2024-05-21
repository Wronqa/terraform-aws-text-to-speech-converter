locals {
  lambda_source_dir = "${path.module}/src/"
  lambda_source_zip = "${path.module}/dist/text-to-speech-lambda.zip"
}

provider "archive" {
}

data "archive_file" "text_to_speech_lambda_zip" {
  type        = "zip"
  source_dir  = local.lambda_source_dir
  output_path = local.lambda_source_zip
}

resource "aws_lambda_function" "text_to_speech_lambda" {
  function_name = var.lambda_name
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.12"
  memory_size   = 1024
  timeout       = 900
  filename      = data.archive_file.text_to_speech_lambda_zip.output_path
  role          = aws_iam_role.lambda_role.arn
}
