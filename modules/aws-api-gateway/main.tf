resource "aws_api_gateway_rest_api" "aws_gateway_rest_api" {
  name               = var.api_gateway_name
  description        = "API for pass request body to lambda"
  binary_media_types = ["audio/mpeg"]
}

resource "aws_api_gateway_request_validator" "aws_gateway_body_validator" {
  name                        = "body_validator"
  rest_api_id                 = aws_api_gateway_rest_api.aws_gateway_rest_api.id
  validate_request_body       = true
  validate_request_parameters = false
}

resource "aws_api_gateway_resource" "path_name" {
  rest_api_id = aws_api_gateway_rest_api.aws_gateway_rest_api.id
  parent_id   = aws_api_gateway_rest_api.aws_gateway_rest_api.root_resource_id
  path_part   = "convert"
}

resource "aws_api_gateway_method" "post_method" {
  depends_on           = [aws_api_gateway_model.text_model]
  rest_api_id          = aws_api_gateway_rest_api.aws_gateway_rest_api.id
  http_method          = "POST"
  resource_id          = aws_api_gateway_resource.path_name.id
  authorization        = "NONE"
  request_validator_id = aws_api_gateway_request_validator.aws_gateway_body_validator.id

  request_models = {
    "application/json" = "Text"
  }
}

resource "aws_api_gateway_integration" "post_intergration" {
  rest_api_id = aws_api_gateway_rest_api.aws_gateway_rest_api.id
  resource_id = aws_api_gateway_resource.path_name.id
  http_method = aws_api_gateway_method.post_method.http_method

  integration_http_method = "POST"
  type                    = "AWS"
  uri                     = var.text_to_speech_lambda.invoke_arn
  credentials             = aws_iam_role.api_gateway_role.arn
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
