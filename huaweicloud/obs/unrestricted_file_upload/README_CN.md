# 华为云 OBS 任意文件上传漏洞环境

[English](./README.md) | 中文

## 描述信息

这是一个用于构建华为云对象存储任意文件上传的漏洞环境靶场。

使用 Terraform 构建环境后，用户可以在存在漏洞的 Bucket 中上传任意文件。

## 环境搭建

在容器中运行

```shell
cd /TerraformGoat/huaweicloud/obs/unrestricted_file_upload/
```

编辑 `terraform.tfvars` 文件，在文件中填入你的 `huaweicloud_access_key` 和 `huaweicloud_secret_key`

> 在华为云「控制台 --》我的凭证」处可以找到访问密钥

```shell
vim terraform.tfvars
```

部署靶场

```shell
terraform init
terraform apply
```

> 在终端提示 `Enter a value:` 时，输入 `yes` 即可

![image](../../../images/1650797768.png)

当命令执行完后，在 Outputs 处可以看到 Bucket 名称。

## 漏洞利用

使用 PUT 方法上传文件

![image](../../../images/1650858458.png)

尝试读取上传的文件，发现可以读取

![image](../../../images/1650858524.png)

## 销毁环境

```shell
terraform destroy
```
