# AWS VPC security group open all ports

English | [中文](./README_CN.md)

## Description

This is a scenario used to build the AWS VPC security group open all ports.

## Deployment Environment

Execute the following command in the container

```shell
cd /TerraformGoat/aws/networking/vpc_security_group_open_all_ports
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

View security group rules.

```bash
> aws ec2 describe-security-groups --group-ids sg-015ab313fbb70s95b

{
    "SecurityGroups": [
        {
            "Description": "Managed by Terraform",
            "GroupName": "huocorp_terraform_goat_security_group",
            "IpPermissions": [
                {
                    "FromPort": 1,
                    "IpProtocol": "tcp",
                    "IpRanges": [
                        {
                            "CidrIp": "0.0.0.0/0"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "ToPort": 65535,
                    "UserIdGroupPairs": []
                }
            ],
            "OwnerId": "0123456789012",
            "GroupId": "sg-015ab313fbb70s95b",
            "IpPermissionsEgress": [],
            "VpcId": "vpc-13194b56d96ac1f8h"
        }
    ]
}
```

## Destroy the environment

```shell
terraform destroy
```
