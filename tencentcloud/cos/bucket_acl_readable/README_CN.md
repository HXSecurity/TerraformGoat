# 腾讯云 COS Bucket ACL 可读场景

[English](./README.md) | 中文

## 描述信息

这是一个用于构建腾讯云 COS Bucket ACL 可读的场景。

## 场景搭建

在容器中执行以下命令

```shell
cd /TerraformGoat/tencentcloud/cos/bucket_acl_readable
```

编辑 `terraform.tfvars` 文件，在文件中填入你的`tencentcloud_secret_id`和`tencentcloud_secret_key`

```shell
vim terraform.tfvars
```

> 在腾讯云控制台的 [API 密钥管理](https://console.cloud.tencent.com/cam/capi)可以创建和查看您的 SecretID 和 SecretKey

部署靶场

```shell
terraform init
terraform apply
```

> 在终端提示 `Enter a value:` 时，输入 `yes` 即可

当命令执行完后，在 Outputs 处可以看到 Bucket 名称。

## 操作

查看 Bucket 的 ACL 策略

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

## 销毁环境

```shell
terraform destroy
```
