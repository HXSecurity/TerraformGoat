# 描述

[English](./README.md) | 中文

这是一个可以帮你快速构建存储桶对象遍历的脚本

在得到FLag之后，可以通过查看源代码来发现什么配置的情况下会造成这种问题

## 部署环境

```bash
cd /TerraformGoat/aliyun/object_storage_service/bucket_object_traversal/
```

配置阿里云访问凭证

```shell
aliyun configure
```

> 在阿里云控制台的 [AccessKey 页面](https://ram.console.aliyun.com/manage/ak) 可以创建和查看您的 AccessKey

```BASH
terraform init
```

![image-20220420183822046](../../../images/UzJuMarkDownImage20220420183822046_1.png)

```bash
terraform apply
```

如果确认没有问题，按下回车即可

![image-20220420184331190](../../../images/UzJuMarkDownImage20220420184734125_6.png)

输入yes开始构建，然后您可以去冲一杯咖啡，因为它会在您回来之前完成，非常快!

![image-20220420184456968](../../../images/UzJuMarkDownImage20220420184708033_5.png)

访问 hx-cloud-security-ctf-xxx.oss-cn-beijing.aliyuncs.com

## Get Flag

![image-20220425122303981](../../../images/UzJuMarkDownImageimage-20220425122303981.png)

找到文件位置，在/index.png

![image-20220425122323577](../../../images/UzJuMarkDownImageimage-20220425122323577.png)

但是并不是一张图片

![image-20220425122347527](../../../images/UzJuMarkDownImageimage-20220425122347527.png)

这是什么？也许可以去查询经纬度来判断这是位置是哪里！

## 销毁挑战

```bash
terraform destroy
```

![image-20220420184708033](../../../images/UzJuMarkDownImage20220420184331190_3.png)

确定没有问题之后，输入yes即可销毁

![image-20220420184734125](../../../images/UzJuMarkDownImage20220420184456968_4.png)
