# Huawei Cloud OBS special bucket policy vulnerable environment

English | [中文](./README_CN.md)

## Description

This is a vulnerability environment scenario for building a special bucket policy for HUAWEI CLOUD object storage.

After you build an environment using Terraform, you can configure specific bucket policies to read data that would otherwise not be readable.

## Deployment Environment

run in a container

```shell
cd /TerraformGoat/huaweicloud/obs/special_bucket_policy/
```

Edit the `terraform.tfvars` file and fill in the file with your `huaweicloud_access_key` and `huaweicloud_secret_key`.

> The access key can be found in HUAWEI CLOUD [Console --> My Credentials]

```shell
vim terraform.tfvars
```

Deploy Vulnerable Environment

```shell
terraform init
terraform apply
```

> When the terminal prompts `Enter a value:`, enter `yes`

![image](../../../images/1650797768.png)

After the command is executed, you can see the Bucket name in Outputs. This Bucket has a special Bucket policy, the policy is as follows:

```shell
{
    "Version": "2008-10-17", 
    "Id": "HuoXianPolicy", 
    "Statement": [
        {
            "Effect": "Allow", 
            "Principal": "*", 
            "Action": "s3:GetObject", 
            "Resource": "arn:aws:s3:::bucket_name/flag", 
            "Condition": {
                "StringLike": {
                    "aws:UserAgent": "HuoXian"
                }
            }
        }
    ]
}
```

## Vulnerability Utilization

Observe the policy file, you can know that the flag file can be read by setting UserAgent to HuoXian. For more explanation of Condition, please refer to: [https://docs.aws.amazon.com/zh_cn/AmazonS3/latest/userguide/amazon-s3-policy-keys.html](https://docs.aws.amazon.com/zh_cn/AmazonS3/latest/userguide/amazon-s3-policy-keys.html)

```shell
https://hx-cloud-security-xxx.obs.cn-north-1.myhuaweicloud.com/flag
```

Normal access can see the prompt AccessDenied

![image](../../../images/1650779408.png)

Set UserAgent to HuoXian, you can see that the flag file is successfully read

![image](../../../images/1650798373.png)

## Destroy the environment

```shell
terraform destroy
```
