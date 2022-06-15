# AWS snapshots are unencrypted

English | [中文](./README_CN.md)

## Description

This is a scenario used to build the AWS snapshots are unencrypted.

## Deployment Environment

Execute the following command in the container

```shell
cd /TerraformGoat/aws/ec2/snapshots_of_EBS_volumes_are_unencrypted
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

After the environment is set up, You can see the snapshot id of the scenario at Outputs.

## Steps

View the encryption of a snapshot.

```bash
> aws ec2 describe-snapshots --snapshot-ids snap-1234567890abcdef0

{
    "Snapshots": [
        {
            "Description": "",
            "Encrypted": false,
            "OwnerId": "012345678910",
            "Progress": "100%",
            "SnapshotId": "snap-1234567890abcdef0",
            "StartTime": "2022-06-15T10:07:39.758Z",
            "State": "completed",
            "VolumeId": "vol-049df61146c4d7901",
            "VolumeSize": 8
        }
    ]
}
```

## Destroy the environment

```shell
terraform destroy
```
