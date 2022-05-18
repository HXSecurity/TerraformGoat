# Huawei Cloud OBS unrestricted file upload vulnerability environment

English | [中文](./README_CN.md)

## Description

This is a vulnerability environment scenario for building Huawei Cloud object storage unrestricted file upload.

After building the environment with Terraform, Users can upload unrestricted file in the vulnerable bucket.

## Deployment Environment

run in a container

```shell
cd /TerraformGoat/huaweicloud/obs/unrestricted_file_upload/
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

After the environment is set up, you can see the created Bucket at Outputs.

## Vulnerability Utilization

Upload files using the PUT method

![image](../../../images/1650858458.png)

Access the file just uploaded and find that it can be read.

![image](../../../images/1650858524.png)

## Destroy the environment

```shell
terraform destroy
```
