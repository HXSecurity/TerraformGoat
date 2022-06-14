# Alibaba Cloud VPC Security group open all ports

English | [中文](./README_CN.md)

## Description

This is a scenario used to build the Alibaba Cloud VPC security group open all ports.

## Deployment Environment

Execute the following command in the container

```shell
cd /TerraformGoat/aliyun/networking/vpc_security_group_open_all_ports
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

View the rules for the security group via the aliyun command line tool.

```bash
> aliyun ecs DescribeSecurityGroupAttribute --SecurityGroupId sg-2zebb34geaa1x63gtkor

{
  "Description": "",
  "RequestId": "68C5FDBC-64DE-58B5-BA3F-7EF4DDD0AA82",
  "SecurityGroupName": "huocorp_terraform_goat_security_group",
  "VpcId": "vpc-2ze61byz86qst1qstj5id",
  "SecurityGroupId": "sg-2zebb34geaa1x63gtkor",
  "Permissions": {
    "Permission": [
      {
        "SourceGroupId": "",
        "Policy": "Accept",
        "Description": "",
        "SourcePortRange": "",
        "Priority": 1,
        "CreateTime": "2022-06-08T10:52:52Z",
        "DestPrefixListName": "",
        "Ipv6SourceCidrIp": "",
        "NicType": "intranet",
        "DestGroupId": "",
        "Direction": "ingress",
        "SourceGroupName": "",
        "PortRange": "1/65535",
        "DestGroupOwnerAccount": "",
        "DestPrefixListId": "",
        "SourceCidrIp": "0.0.0.0/0",
        "SourcePrefixListName": "",
        "IpProtocol": "TCP",
        "DestCidrIp": "",
        "DestGroupName": "",
        "SourceGroupOwnerAccount": "",
        "Ipv6DestCidrIp": "",
        "SourcePrefixListId": ""
      }
    ]
  },
  "RegionId": "cn-beijing",
  "InnerAccessPolicy": "Accept"
}
```

From the returned result, you can know that the current security group allows IPs from 0.0.0.0/0 to access port 1/65535, which means that everyone is allowed to access all ports.

## Destroy the environment

```shell
terraform destroy
```
