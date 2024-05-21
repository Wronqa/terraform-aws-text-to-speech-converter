resource "aws_api_gateway_rest_api" "aws_gateway_rest_api" {
  name        = "aws_gateway_rest_api"
  description = "API for pass request body to lambda"

  binary_media_types = ["audio/mpeg"]
}

resource "aws_api_gateway_resource" "path_name" {
  rest_api_id = aws_api_gateway_rest_api.aws_gateway_rest_api.id
  parent_id   = aws_api_gateway_rest_api.aws_gateway_rest_api.root_resource_id
  path_part   = "convert"
}

resource "aws_api_gateway_method" "post_method" {
  depends_on    = [aws_api_gateway_model.text_model]
  rest_api_id   = aws_api_gateway_rest_api.aws_gateway_rest_api.id
  http_method   = "POST"
  resource_id   = aws_api_gateway_resource.path_name.id
  authorization = "NONE"

  request_models = {
    "application/json" = "Text"
  }
}

resource "aws_api_gateway_integration" "post_intergration" {
  rest_api_id = aws_api_gateway_rest_api.aws_gateway_rest_api.id
  resource_id = aws_api_gateway_resource.path_name.id
  http_method = aws_api_gateway_method.post_method.http_method

  integration_http_method = "POST"

  type = "AWS"

  uri = var.text_to_speech_lambda.invoke_arn

  credentials = aws_iam_role.api_gateway_role.arn
}

resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = var.text_to_speech_lambda.name
  principal     = "apigateway.amazonaws.com"

  # More: http://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-control-access-using-iam-policies-to-invoke-api.html
  #source_arn = "arn:aws:execute-api:${var.myregion}:${var.accountId}:${aws_api_gateway_rest_api.api.id}/*/${aws_api_gateway_method.method.http_method}${aws_api_gateway_resource.resource.path}"
}

resource "aws_api_gateway_deployment" "rest_api_deployment" {
  depends_on  = [aws_api_gateway_integration.post_intergration, aws_api_gateway_integration_response.post-200-integration, aws_api_gateway_integration_response.post-400-integration, aws_api_gateway_integration_response.post-500-integration]
  rest_api_id = aws_api_gateway_rest_api.aws_gateway_rest_api.id
}

resource "aws_api_gateway_stage" "rest_api_deployment_stage" {

  deployment_id = aws_api_gateway_deployment.rest_api_deployment.id
  rest_api_id   = aws_api_gateway_rest_api.aws_gateway_rest_api.id
  stage_name    = "v1"
}
