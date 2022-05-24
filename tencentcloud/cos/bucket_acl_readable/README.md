# Tencent Cloud COS Bucket ACL Readable Scenario

English | [中文](./README_CN.md)

## Description

This is the scenario in which the Tencent Cloud COS bucket ACL is readable.

## Deployment Environment

Execute the following command in the container

```shell
cd /TerraformGoat/tencentcloud/cos/bucket_acl_readable
```

Edit the `terraform.tfvars` file and write your `tencentcloud_secret_id`and`tencentcloud_secret_key` in the file

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

After the environment is set up, you can see the created Bucket at Outputs.

## Steps

View Bucket's ACL

```shell
curl https://houxian-xxx-xxx.cos.ap-beijing.myqcloud.com/?acl
```

```xml
<AccessControlPolicy>
  <Owner>
    <ID>qcs::cam::uin/xxx:uin/xxx</ID>
    <DisplayName>qcs::cam::uin/xxx:uin/xxx</DisplayName>
  </Owner>
  <AccessControlList>
    <Grant>
      <Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="CanonicalUser">
        <ID>qcs::cam::uin/xxx:uin/xxx</ID>
        <DisplayName>qcs::cam::uin/xxx:uin/xxx</DisplayName>
      </Grantee>
      <Permission>FULL_CONTROL</Permission>
    </Grant>
    <Grant>
      <Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="Group">
        <URI>http://cam.qcloud.com/groups/global/AllUsers</URI>
      </Grantee>
      <Permission>READ_ACP</Permission>
    </Grant>
  </AccessControlList>
</AccessControlPolicy>
```

## Destroy the environment

```shell
terraform destroy
```
