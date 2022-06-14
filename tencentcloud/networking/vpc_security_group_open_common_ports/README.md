# Tencent Cloud VPC security group open common ports

English | [中文](./README_CN.md)

## Description

This is a scenario used to build the Tencent Cloud VPC security group open common ports.

## Deployment Environment

Execute the following command in the container

```shell
cd /TerraformGoat/tencentcloud/networking/vpc_security_group_open_common_ports
```

Edit the `terraform.tfvars` file and write your `tencentcloud_secret_id` and `tencentcloud_secret_key` in the file

```shell
vim terraform.tfvars
```

> You can create and view your SecretKey on the [API Key Management](https://console.cloud.tencent.com/cam/capi) of the Tencent Cloud console

Deploy Vulnerable Environment

```shell
terraform init
terraform apply
```

> When the terminal prompts `Enter a value:`, enter `yes`

After the environment is set up, you can see the instance and security group IDs at Outputs

## Steps

Use the Tencent Cloud command line tool to view the rules of the security group.

```bash
> apt-get install jq -y
> tccli vpc DescribeSecurityGroupPolicies --SecurityGroupId sg-o1alubhn | jq '.SecurityGroupPolicySet.Ingress[] | select(.Protocol == "tcp") | select(.CidrBlock == "0.0.0.0/0") | select(.Action == "ACCEPT") | .Port'

"5432"
"25"
"9200"
"4506"
"50070"
"2376"
"21"
"138"
"5500"
"5601"
"50470"
"3389"
"6379"
"4505"
"8020"
"1522"
"23"
"22"
"2375"
"3306"
"5900"
"137"
"1433"
"1521"
"445"
"27017"
"1434"
```

## Destroy the environment

```shell
terraform destroy
```
