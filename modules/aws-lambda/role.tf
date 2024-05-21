locals {
  lambda_role_path         = file("${path.module}/policies/lambda.role.json")
  polly_access_policy_path = file("${path.module}/policies/polly-access.policy.json")
  s3_access_policy_path    = file("${path.module}/policies/s3-access.policy.json")
}

resource "aws_iam_role" "lambda_role" {
  name               = "text_to_speech_lambda_role"
  assume_role_policy = local.lambda_role_path
}

#Polly access policy
resource "aws_iam_policy" "polly_access_policy" {
  name        = "polly_access_policy"
  description = "Policy that's allow lambda to access Polly service"
  policy      = local.polly_access_policy_path
}

resource "aws_iam_role_policy_attachment" "polly_access_atachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.polly_access_policy.arn
}

#S3 access policy
resource "aws_iam_policy" "s3_access_policy" {
  name        = "s3_access_policy"
  description = "Policy that's allow lambda to access S3 service"
  policy      = local.s3_access_policy_path
}

resource "aws_iam_role_policy_attachment" "s3_access_atachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.s3_access_policy.arn
}
