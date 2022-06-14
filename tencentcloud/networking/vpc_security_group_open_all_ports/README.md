# Tencent Cloud VPC security group open all ports

English | [中文](./README_CN.md)

## Description

This is a scenario used to build the Tencent Cloud VPC security group open all ports.

## Deployment Environment

Execute the following command in the container

```shell
cd /TerraformGoat/tencentcloud/networking/vpc_security_group_open_all_ports
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
> tccli vpc DescribeSecurityGroupPolicies --SecurityGroupId sg-bitg1oeb

{
    "SecurityGroupPolicySet": {
        "Version": "1",
        "Egress": [],
        "Ingress": [
            {
                "PolicyIndex": 0,
                "Protocol": "tcp",
                "Port": "1-65535",
                "ServiceTemplate": {
                    "ServiceId": "",
                    "ServiceGroupId": ""
                },
                "CidrBlock": "0.0.0.0/0",
                "Ipv6CidrBlock": "",
                "SecurityGroupId": "",
                "AddressTemplate": {
                    "AddressId": "",
                    "AddressGroupId": ""
                },
                "Action": "ACCEPT",
                "PolicyDescription": "",
                "ModifyTime": "2022-06-09 17:18:02"
            }
        ]
    },
    "RequestId": "41986b77-47e5-46be-980e-1b93c874d5ff"
}
```

## Destroy the environment

```shell
terraform destroy
```
