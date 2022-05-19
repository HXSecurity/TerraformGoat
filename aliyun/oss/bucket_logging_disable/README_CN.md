# 阿里云 OSS Bucket 日志转存未开启场景

[English](./README.md) | 中文

## 描述信息

这是一个用于构建阿里云 OSS Bucket 日志转存未开启的场景。

## 环境搭建

在容器中执行以下命令

```shell
cd /TerraformGoat/aliyun/oss/bucket_logging_disable
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

使用 aliyun cli 可以查看当前 logging 的配置情况

```shell
aliyun oss logging --method get oss://huoxian-terraformgoat-bucket-xxxxx
```

未配置日志转存的情况

```xml
<?xml version="1.0" encoding="UTF-8"?>
  <BucketLoggingStatus>
    <LoggingEnabled>
      <TargetBucket></TargetBucket>
      <TargetPrefix></TargetPrefix>
    </LoggingEnabled>
  </BucketLoggingStatus>
```

配置了日志转存的情况

```xml
<?xml version="1.0" encoding="UTF-8"?>
  <BucketLoggingStatus>
      <LoggingEnabled>
          <TargetBucket>huoxian-terraformgoat-bucket-xxxxx</TargetBucket>
          <TargetPrefix>log/</TargetPrefix>
      </LoggingEnabled>
  </BucketLoggingStatus>
```

## 销毁环境

```shell
terraform destroy
```
