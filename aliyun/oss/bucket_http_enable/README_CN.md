# 阿里云 OSS Bucket HTTP 传输开启场景

[English](./README.md) | 中文

## 描述信息

这是一个用于构建阿里云 OSS Bucket HTTP 传输开启的场景。

## 环境搭建

在容器中执行以下命令

```shell
cd /TerraformGoat/aliyun/oss/bucket_http_enable
```

配置阿里云访问凭证

```shell
aliyun configure
```

> 在阿里云控制台的 [AccessKey 页面](https://ram.console.aliyun.com/manage/ak) 可以创建和查看您的 AccessKey

部署靶场

```shell
terraform init
terraform apply
```

> 在终端提示 `Enter a value:` 时，输入 `yes` 即可

场景搭建完后，在 Outputs 处可以看到 Bucket 的 URL

## 操作

查看当前策略的配置情况，可以看到 SecureTransport 为 false，且 Effect 为 Allow

```shell
curl http://huoxian-terraformgoat-bucket-xxxxx.oss-cn-beijing.aliyuncs.com/?policy
```

```json
{
    "Version": "1", 
    "Statement": [
        {
            "Effect": "Allow", 
            "Action": [
                "*"
            ], 
            "Principal": [
                "*"
            ], 
            "Resource": [
                "acs:oss:*:*:*"
            ], 
            "Condition": {
                "Bool": {
                    "acs:SecureTransport": [
                        "false"
                    ]
                }
            }
        }
    ]
}
```

## 销毁环境

```shell
terraform destroy
```
