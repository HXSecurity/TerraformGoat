# 描述

[English](./README.md) | 中文

这是一个可以帮你快速构建特殊的存储桶策略的脚本，可能你在实际环境中不会遇到，玩的愉快!

## 部署环境

```bash
cd /TerraformGoat/aws/object_storage_service/special_bucket_policy/
```

![image-20220425205833343](../../../images/image-20220425205833343.png)

配置 AWS 访问凭证

```shell
aws configure
```

> 在 AWS 「控制台——》安全凭证」处可以设置并查看你的 `aws_access_key_id` 和 `aws_secret_access_key`

```bash
terraform init
```

![image-20220425205950630](../../../images/image-20220425205950630.png)

```bash
terraform apply
```

![image-20220425210019067](../../../images/image-20220425210019067.png)

随后输入yes会自动构建，速度非常快

![image-20220425210041960](../../../images/image-20220425210041960.png)

## Get Flag

访问存储桶地址

![image-20220425210110601](../../../images/image-20220425210110601.png)

虽然这里显示了key，但是我们放回会提示`AccessDenied`

![image-20220425210155805](../../../images/image-20220425210155805.png)

我们只需要将UserAgent修改为HxSecurityLab即可

![image-20220425210230286](../../../images/image-20220425210230286.png)

```http
GET /index.html HTTP/1.1
Host: hx-sec-testansmj.s3.eu-west-1.amazonaws.com
User-Agent: HxSecurityLab
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8
Accept-Language: zh-CN,zh;q=0.8,zh-TW;q=0.7,zh-HK;q=0.5,en-US;q=0.3,en;q=0.2
Accept-Encoding: gzip, deflate
Connection: close
Upgrade-Insecure-Requests: 1
```

## 销毁挑战

```bash
terraform destroy
```

![image-20220425210329402](../../../images/image-20220425210329402.png)

随后输入yes即可销毁
