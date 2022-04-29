# 描述

[English](./README.md) | 中文

这是一个可以快速帮你构建存储桶任意文件上传场景的脚本

## 部署环境

```bash
cd /TerraformGoat/tencentcloud/object_storage_service/unrestricted_file_upload/
```

![image-20220425194621232](../../../images/image-20220425194621232.png)

```bash
vim terraform.tfvars
```

写入你的腾讯云账户AK与KEY还有APPID

![image-20220425195518630](../../../images/image-20220425195518630.png)

```bash
terraform init
```

![image-20220425194722112](../../../images/image-20220425194722112.png)

```bash
terraform apply
```

![image-20220425194755297](../../../images/image-20220425194755297.png)

输入你想要创建的存储桶名称，然后回车，检查是否有问题，输入yes即可

![image-20220425195010422](../../../images/image-20220425195010422.png)

直接访问/hx.png

![image-20220425195047346](../../../images/image-20220425195047346.png)

现在我们可以通过PUT方法来覆盖这个文件

![image-20220425195122239](../../../images/image-20220425195122239.png)

```http
PUT /hx.png HTTP/1.1
Host: uzjusecqwe-.cos.ap-nanjing.myqcloud.com
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:99.0) Gecko/20100101 Firefox/99.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8
Accept-Language: zh-CN,zh;q=0.8,zh-TW;q=0.7,zh-HK;q=0.5,en-US;q=0.3,en;q=0.2
Accept-Encoding: gzip, deflate
Connection: close
Upgrade-Insecure-Requests: 1
Content-Length: 13

HxSecurityLab
```

随后使用GET方法来获取我们覆盖的图片

![image-20220425195153269](../../../images/image-20220425195153269.png)

## 销毁挑战

```bash
terraform destroy
```

![image-20220425195226825](../../../images/image-20220425195226825.png)

随后回车，输入yes等待销毁即可
