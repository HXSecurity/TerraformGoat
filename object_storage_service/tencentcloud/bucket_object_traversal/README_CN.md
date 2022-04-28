# 描述

[English](./README.md) | 中文

这是一个可以帮你快速构建存储桶对象遍历场景的脚本

在你完成挑战后，你可以查看源代码以了解为什么会出现这种情况

## 部署环境

```bash
cd /TerraformGoat/TenCentCloud/bucket_object_traversal/
```

![image-20220424172434562](../../../images/UzJuMarkDownImageimage-20220424172434562.png)

编辑terraform.tfvars输入你的腾讯云AK和KEY

```bash
vim terraform.tfvars
```

Tips: 在腾讯云的对象存储中，有一串数字，它来自于账户的APPID。

![image-20220420142509331](../../../images/UzJuMarkDownImageimage-20220420142509331.png)

![image-20220424172800729](../../../images/UzJuMarkDownImageimage-20220424172800729.png)

```bash
terraform init
```

![image-20220420143216521](../../../images/UzJuMarkDownImageimage-20220420143216521.png)

```bash
terraform apply
```

![image-20220424172612699](../../../images/UzJuMarkDownImageimage-20220424172612699.png)

输入BucketName并输入(ps: 存储桶的名称必须小写)

![image-20220424172533527](../../../images/UzJuMarkDownImageUzJuMarkDownImageimage-20220424172533527.png)

检查输出，如果没有问题，输入Yes

![image-20220424172657516](../../../images/UzJuMarkDownImageimage-20220424172657516.png)

现在可以看到输出了存储桶的地址，现在可以去获取Flag了

## Challenge to destroy

```bash
terraform destory
```

![image-20220427185131878](../../../images/image-20220427185131878.png)

如果确认没有问题，输入 yes 然后回车即可

![image-20220424173018520](../../../images/UzJuMarkDownImageimage-20220424173018520.png)

GooOOOOOOOOOOOd Bye~
