#200 Response

resource "aws_api_gateway_method_response" "post-200-response" {
  depends_on  = [aws_api_gateway_model.audio_mpeg_model, aws_api_gateway_integration.post_intergration]
  rest_api_id = aws_api_gateway_rest_api.aws_gateway_rest_api.id
  resource_id = aws_api_gateway_resource.path_name.id
  http_method = aws_api_gateway_method.post_method.http_method
  status_code = "200"

  response_parameters = {
    "method.response.header.Content-Type" = true
  }
  response_models = {
    "audio/mpeg" = "AudioMPEG"
  }
}

resource "aws_api_gateway_integration_response" "post-200-integration" {
  depends_on  = [aws_api_gateway_method_response.post-200-response, aws_api_gateway_integration.post_intergration]
  rest_api_id = aws_api_gateway_rest_api.aws_gateway_rest_api.id
  resource_id = aws_api_gateway_resource.path_name.id
  http_method = aws_api_gateway_method.post_method.http_method
  status_code = aws_api_gateway_method_response.post-200-response.status_code


}

#400 response

resource "aws_api_gateway_method_response" "post-400-response" {
  depends_on  = [aws_api_gateway_integration.post_intergration]
  rest_api_id = aws_api_gateway_rest_api.aws_gateway_rest_api.id
  resource_id = aws_api_gateway_resource.path_name.id
  http_method = aws_api_gateway_method.post_method.http_method
  status_code = "400"
}

resource "aws_api_gateway_integration_response" "post-400-integration" {
  depends_on  = [aws_api_gateway_method_response.post-400-response, aws_api_gateway_integration.post_intergration]
  rest_api_id = aws_api_gateway_rest_api.aws_gateway_rest_api.id
  resource_id = aws_api_gateway_resource.path_name.id
  http_method = aws_api_gateway_method.post_method.http_method
  status_code = aws_api_gateway_method_response.post-400-response.status_code

  selection_pattern = "4\\d{2}"
}

#500 response

resource "aws_api_gateway_method_response" "post-500-response" {
  depends_on = [aws_api_gateway_integration.post_intergration]

  rest_api_id = aws_api_gateway_rest_api.aws_gateway_rest_api.id
  resource_id = aws_api_gateway_resource.path_name.id
  http_method = aws_api_gateway_method.post_method.http_method
  status_code = "500"
}

resource "aws_api_gateway_integration_response" "post-500-integration" {
  depends_on = [aws_api_gateway_method_response.post-500-response, aws_api_gateway_integration.post_intergration]

  rest_api_id = aws_api_gateway_rest_api.aws_gateway_rest_api.id
  resource_id = aws_api_gateway_resource.path_name.id
  http_method = aws_api_gateway_method.post_method.http_method
  status_code = aws_api_gateway_method_response.post-500-response.status_code

  selection_pattern = "5\\d{2}"
}
