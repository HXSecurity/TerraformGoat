# GCP 云存储任意文件上传漏洞环境

[English](./README.md) | 中文

## 描述信息

这是一个用于构建 GCP 云存储任意文件上传的漏洞环境靶场。

使用 Terraform 构建环境后，用户可以通过 PUT 方式上传任意文件到云存储。

## 环境搭建

通过以下命令进行 gcp 身份认证，在[服务账户](https://console.cloud.google.com/projectselector2/iam-admin/serviceaccounts?supportedpurview=project)处生成一个密钥文件，将密钥复制到容器中进行身份认证

```shell
docker cp key.json terraformgoat:/terraformgoat # 在宿主机中运行
docker exec -it terraformgoat /bin/bash  # 在宿主机中运行
gcloud auth activate-service-account --key-file key.json # 在容器中运行
```

在容器中执行以下命令

```shell
cd /TerraformGoat/gcp/cs/unrestricted_file_upload/
```

编辑 `terraform.tfvars` 文件，在文件中填入你的 `gcp project id`

```shell
vim terraform.tfvars
```

部署靶场

```shell
terraform init
terraform apply
```

> 在终端提示 `Enter a value:` 时，输入 `yes` 即可

![image](../../../images/1650957671.png)

当命令执行完后，在 Outputs 处可以看到 Bucket 名称。

## 漏洞利用

使用 PUT 方法上传文件，发现可以成功上传

![image](../../../images/1650970696.png)

可以成功访问到刚上传的文件

![image](../../../images/1650970770.png)

## 销毁环境

```shell
terraform destroy
```
