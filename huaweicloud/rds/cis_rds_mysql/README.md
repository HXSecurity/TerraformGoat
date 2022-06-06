## Huawei Cloud RDS Mysql Baseline Checking Environment Quick Build

English | [中文](./README_CN.md)

## Description

This is a sample script that helps you quickly create Huawei Cloud RDS Mysql that can be used for baseline inspection

Such as the following CIS security check criteria

1. Ensure that the RDS instance requires all incoming connections to use SSL (automatically)

2. Ensure that the server parameter "log_disconnections" of the PostgreSQL database server is set to "ON".

3. Ensure that the server parameter "log_duration" is set to "ON" for the post-log_duration database server

4. Make sure that the parameter "log_connections" of the PostgreSQL database server is set to "ON".

.....

## Environment build

Run in a container

```bash
cd /TerraformGoat/huaweicloud/rds/cis_rds_mysql/
```

Edit the `terraform.tfvars` file and fill in your `huaweicloud_access_key` and `huaweicloud_secret_key` in the file

> You can find the access key at Huawei Cloud "Console --> My Credentials".

```bash
vim terraform.tfvars
```

Deployment of firing ranges

```bash
terraform init
terraform apply
```

> When prompted with `Enter a value:`, type `yes` at the terminal

## Destroy the environment

```bash
terraform destroy
```
