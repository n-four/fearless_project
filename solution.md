This is my repository for Fearless Project Challenge v.01

Description: Monitor customer's domains for SSL certificates. Check for SSL cert validity 

Must Haves:
1. A serverless function which checks the SSL certificate expiration in an HTTP response
2. Infrastructure as Code representing a deployment to AWS Lambda with an AWS API
Gateway for invocation
3. Includes a solution.md that provides relevant documentation including how to build
and run the solution

Instructions:
1. Copy repo
2. Install Terraform/AWS dependent packages
3. Run: terraform init
4. Run: terraform validate
5. Run: terraform apply
6. All set!

Future plans if given more time:
- Complete proper Lambda function
- Utilize resources in api_gateway.tf such as aws_api_gateway_method and aws_api_gateway_integration
- Add an SNS layer to function to alert via email/text through AWS
