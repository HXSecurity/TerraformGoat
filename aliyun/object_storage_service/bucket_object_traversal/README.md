# Description

English | [中文](./README_CN.md)

This is a script that will help you quickly build a storage bucket object traversal scenario.

```bash
cd /TerraformGoat/aliyun/object_storage_service/bucket_object_traversal/
```

Configure Alibaba Cloud Access Credentials

```shell
aliyun configure
```

> You can create and view your AccessKey on the [AccessKey page](https://ram.console.aliyun.com/manage/ak) of the Alibaba Cloud console

```BASH
terraform init
```

![image-20220420183822046](../../../images/UzJuMarkDownImage20220420183822046_1.png)

```bash
terraform apply
```

If you confirm that there are no problems, just press enter

![image-20220420184708033](../../../images/UzJuMarkDownImage20220420184331190_3.png)

Type “yes” to start the build, at which point you can go make a cup of coffee because it will be done before you get back, very fast!

![image-20220420184734125](../../../images/UzJuMarkDownImage20220420184456968_4.png)

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

![image-20220420184456968](../../../images/UzJuMarkDownImage20220420184708033_5.png)

If you have made up your mind, then just type yes

![image-20220420184331190](../../../images/UzJuMarkDownImage20220420184734125_6.png)
