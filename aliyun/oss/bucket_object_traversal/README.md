# Description

English | [中文](./README_CN.md)

This is a script that will help you quickly build a storage bucket object traversal scenario.

```bash
cd /TerraformGoat/aliyun/oss/bucket_object_traversal/
```

Configure Alibaba Cloud Access Credentials

```shell
aliyun configure
```

> You can create and view your AccessKey on the [AccessKey page](https://ram.console.aliyun.com/manage/ak) of the Alibaba Cloud console

```BASH
terraform init
terraform apply
```

If you confirm that there are no problems, Type “yes” to start the build

Access to hx-cloud-security-ctf-xxx.oss-cn-beijing.aliyuncs.com

## Get Flag

![image-20220425122303981](../../../images/UzJuMarkDownImageimage-20220425122303981.png)

Find File Location, in /index.png

![image-20220425122323577](../../../images/UzJuMarkDownImageimage-20220425122323577.png)

But it is not a picture.

![image-20220425122347527](../../../images/UzJuMarkDownImageimage-20220425122347527.png)

What is this? Maybe you can check the latitude and longitude to determine where this is the location!

## Destruction Challenge

```bash
terraform destroy
```

If you have made up your mind, then just type yes
