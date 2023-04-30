# infra-staging

## Steps to build the resources:

1. aws credentials setup:
  ```
  brew install awscli
  vi ~/.aws/credentials
  ```
  Paste this format and change to your values.
  ```
  [profile_name]
  aws_access_key_id=...
  aws_secret_access_key=...

  ```
  Run this command:
  ```
  export AWS_PROFILE=profile_name
  ```
2. Install Terraform then build resources.
  Run the following commands
  ```
  brew install terraform
  terraform init
  terraform plan
  terraform apply --auto-approve

  ```
