locals {
  lambda_zip_location = "outputs/SSLCert.zip"
}

#Archive file
data "archive_file" "SSLCertChecker" {
  type        = "zip"
  source_file = "/usr/local/etc/fearless_project/SSLCertChecker.py"
  output_path = local.lambda_zip_location
}

#Create the AWS Lambda function
resource "aws_lambda_function" "ssl_lambda" {

  filename      = local.lambda_zip_location
  function_name = "SSCertChecker"
  role          = aws_iam_role.lambda_role.arn
  handler       = "SSLCertChecker.check"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  #@source_code_hash = filebase64sha256(local.lambda_zip_location)

  runtime = "python3.7"


}
