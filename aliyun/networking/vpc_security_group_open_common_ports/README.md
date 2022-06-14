# Alibaba Cloud VPC Security group open common ports

English | [中文](./README_CN.md)

## Description

This is a scenario used to build the Alibaba Cloud VPC security group open common ports.

## Deployment Environment

Execute the following command in the container

```shell
cd /TerraformGoat/aliyun/networking/vpc_security_group_open_common_ports
```

Configure Alibaba Cloud Access Credentials

```shell
aliyun configure
```

> You can create and view your AccessKey on the [AccessKey page](https://ram.console.aliyun.com/manage/ak) of the Alibaba Cloud console

Deploy Vulnerable Environment

```shell
terraform init
terraform apply
```

> When the terminal prompts `Enter a value:`, enter `yes`

After the environment is set up, you can see the ID of the security group at Outputs.

## Steps

View the ports in the security group that everyone is allowed to access via the aliyun command line tool.

```bash
apt-get install jq -y
aliyun ecs DescribeSecurityGroupAttribute --SecurityGroupId sg-1zeffzf4e3akdwklefyf | jq '.Permissions.Permission[] | select(.Policy == "Accept") | select(.SourceCidrIp == "0.0.0.0/0") | select(.IpProtocol == "TCP") | .PortRange'
```

```bash
> aliyun ecs DescribeSecurityGroupAttribute --SecurityGroupId sg-1zeffzf4e3akdwklefyf | jq '.Permissions.Permission[] | select(.Policy == "Accept") | select(.SourceCidrIp == "0.0.0.0/0") | select(.IpProtocol == "TCP") | .PortRange'

"27017/27017"
"4505/4505"
"21/21"
"5601/5601"
"1521/1521"
"3389/3389"
"138/138"
"137/137"
"3306/3306"
"50070/50070"
"23/23"
"50470/50470"
"5432/5432"
"8020/8020"
"6379/6379"
"1522/1522"
"445/445"
"4506/4506"
"1433/1433"
"2375/2375"
"2376/2376"
"5500/5500"
"9200/9200"
"5900/5900"
"25/25"
"1434/1434"
"22/22"
```

## Destroy the environment

```shell
terraform destroy
```
