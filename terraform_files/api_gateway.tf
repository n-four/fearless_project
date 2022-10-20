#Create AWS REST API Gateway
resource "aws_api_gateway_rest_api" "aws_api" {
  body = jsonencode({
    openapi = "3.0.1"
    info = {
      title   = "aws_api"
      version = "1.0"
    }
    paths = {
      "/path1" = {
        get = {
          x-amazon-apigateway-integration = {
            httpMethod           = "GET"
            payloadFormatVersion = "1.0"
            type                 = "HTTP_PROXY"
            uri                  = "https://ip-ranges.amazonaws.com/ip-ranges.json"
          }
        }
      }
    }
  })

  name = "aws_api"

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

#Create AWS API Gateway deployment resource
resource "aws_api_gateway_deployment" "aws_api_dply" {
  rest_api_id = aws_api_gateway_rest_api.aws_api.id

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.aws_api.body))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "aws_api_stg" {
  deployment_id = aws_api_gateway_deployment.aws_api_dply.id
  rest_api_id   = aws_api_gateway_rest_api.aws_api.id
  stage_name    = "staging"
}
