# Description

English | [中文](./README_CN.md)

This is a script that will help you quickly start a storage bucket with a special policy configuration, Get Flag

Although in actual use will not encounter this kind of range, but enjoy playing

## Deployment Environment

### Git Clone

```bash
cd /TerraformGoat/aliyun/object_storage_service/special_bucket_policy/
```

![image-20220425182349048](../../../images/image-20220425182349048.png)

```BASH
terraform init
```

![image-20220425182407093](../../../images/image-20220425182407093.png)

```bash
terraform apply
```

![image-20220425182434280](../../../images/image-20220425182434280.png)

If you confirm that there are no problems, just type yes

![image-20220425182506076](../../../images/image-20220425182506076.png)

## Get Flag

![image-20220425182550091](../../../images/image-20220425182550091.png)

**The bucket you access does not belong to you.**

![image-20220425182750630](../../../images/image-20220425182750630.png)

Add UserAgent to the request header

```http
GET / HTTP/1.1
Host: hx-cloud-security-ctf-eti6p.oss-cn-beijing.aliyuncs.com
User-Agent: HxSecurityLab
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8
Accept-Language: zh-CN,zh;q=0.8,zh-TW;q=0.7,zh-HK;q=0.5,en-US;q=0.3,en;q=0.2
Accept-Encoding: gzip, deflate
Connection: close
Upgrade-Insecure-Requests: 1
```

When you see the file name, just visit that name **UkFrpYnoTbbQyhpx.html**

![image-20220425182853118](../../../images/image-20220425182853118.png)

## Destruction Challenge

```bash
terraform destroy
```

![image-20220425182951151](../../../images/image-20220425182951151.png)

If it is confirmed that there is no problem, just type yes and wait

![image-20220425183028857](../../../images/image-20220425183028857.png)
