module "api_gateway" {
  source                = "./modules/aws-api-gateway"
  region                = var.region
  text_to_speech_lambda = module.lambda.text_to_speech_lambda
}

module "lambda" {
  source = "./modules/aws-lambda"
}
