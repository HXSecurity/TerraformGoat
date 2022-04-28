# 描述

[English](./README.md) | 中文

这是一个可以帮你快速构建存储桶任意文件覆盖场景的脚本

## 部署环境

```bash
cd /TerraformGoat/Aws/unrestricted_file_upload/
```

![image](../../../images/UzJuMarkDownImageimage-20220426122100745.png)

```bash
terraform init
```

![image-20220426122243708](../../../images/image-20220426122243708.png)

```bash
terraform apply
```

![image-20220426122302921](../../../images/image-20220426122302921.png)

![image-20220426122334770](../../../images/image-20220426122334770.png)

## Exploit

访问我们构建的存储桶

![image-20220426122407418](../../../images/image-20220426122407418.png)

![image-20220426122453542](../../../images/image-20220426122453542.png)

我们可以在该存储桶上上传任意的文件

![image-20220426143627488](../../../images/image-20220426143627488.png)

![image-20220426143639149](../../../images/image-20220426143639149.png)

## 销毁挑战

```bash
terraform destroy
```

![image-20220426122633164](../../../images/image-20220426122633164.png)

输入yes等待销毁即可
