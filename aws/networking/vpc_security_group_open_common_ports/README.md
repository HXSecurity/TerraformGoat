# AWS VPC security group open common ports

English | [中文](./README_CN.md)

## Description

This is a scenario used to build the AWS VPC security group open common ports.

## Deployment Environment

Execute the following command in the container

```shell
cd /TerraformGoat/aws/networking/vpc_security_group_open_common_ports
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

After the environment is set up, you can see the ID of the security group at Outputs.

## Steps

View the ports included in the security group rule.

```bash
> apt-get install jq -y
> aws ec2 describe-security-groups --group-ids sg-13sbeeca31d21a0f3 | jq '.SecurityGroups[].IpPermissions[].FromPort'

4506
1522
2375
445
3389
138
1521
50070
21
6379
25
23
5601
27017
1434
9200
1433
5432
2376
5900
4505
5500
137
22
8020
50470
3306
```

## Destroy the environment

```shell
terraform destroy
```
