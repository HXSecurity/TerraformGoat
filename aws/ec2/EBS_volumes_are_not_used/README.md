# AWS EBS volume are not used

English | [中文](./README_CN.md)

## Description

This is a scenario used to build the AWS EBS volume are not used.

## Deployment Environment

Execute the following command in the container

```shell
cd /TerraformGoat/aws/ec2/EBS_volumes_are_not_used
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

You can see the ID of the volume in the Outputs.

## Steps

Get the EBS status, if the State is available, the EBS is unused.

```bash
> aws ec2 describe-volumes --volume-ids vol-1234567890abcdef0

{
    "Volumes": [
        {
            "Attachments": [],
            "AvailabilityZone": "us-east-1a",
            "CreateTime": "2022-06-16T06:38:32.476Z",
            "Encrypted": false,
            "Size": 1,
            "SnapshotId": "",
            "State": "available",
            "VolumeId": "vol-1234567890abcdef0",
            "Iops": 100,
            "VolumeType": "gp2",
            "MultiAttachEnabled": false
        }
    ]
}
```

## Destroy the environment

```shell
terraform destroy
```
