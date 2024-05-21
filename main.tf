module "api_gateway" {
  source                = "./modules/aws-api-gateway"
  region                = var.region
  api_gateway_name      = var.api_gateway_name
  text_to_speech_lambda = module.lambda.text_to_speech_lambda
}

module "lambda" {
  source      = "./modules/aws-lambda"
  lambda_name = var.lambda_name
}
