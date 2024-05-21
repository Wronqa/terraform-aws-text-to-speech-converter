locals {
  api_gateway_role_path     = file("${path.module}/policies/api-gateway.role.json")
  invoke_lambda_policy_path = file("${path.module}/policies/invoke-lambda.policy.json")
}

resource "aws_iam_role" "api_gateway_role" {
  name               = "api_gateway_role"
  assume_role_policy = local.api_gateway_role_path
}

resource "aws_iam_policy" "invoke_lambda_policy" {
  name        = "lambda_invoke_policy"
  description = "Allow lambda invoke policy"
  policy      = local.invoke_lambda_policy_path
}

resource "aws_iam_role_policy_attachment" "handler_lambda_policy_attachment" {
  role       = aws_iam_role.api_gateway_role.name
  policy_arn = aws_iam_policy.invoke_lambda_policy.arn
}
