# AWS 安全组允许常见端口访问

[English](./README.md) | 中文

## 描述信息

这是一个用于构建 AWS 安全组允许常见端口访问的场景。

## 环境搭建

在容器中执行以下命令

```shell
cd /TerraformGoat/aws/networking/vpc_security_group_open_common_ports
```

配置 AWS 访问凭证

```shell
aws configure
```

> 在 AWS 「控制台——》安全凭证」处可以设置并查看你的 `aws_access_key_id` 和 `aws_secret_access_key`

部署靶场

```shell
terraform init
terraform apply
```

> 在终端提示 `Enter a value:` 时，输入 `yes` 即可

环境搭建完后，在 Outputs 处可以看到安全组的 ID

## 步骤

查看创建的安全组规则所包含的端口。

```bash
> aws ec2 describe-security-groups --group-ids sg-13sbeeca31d21a0f3 | jq '.SecurityGroups[].IpPermissions[].FromPort'

4506
1522
2375
445
3389
138
1521
50070
21
6379
25
23
5601
27017
1434
9200
1433
5432
2376
5900
4505
5500
137
22
8020
50470
3306
```

## 销毁环境

```shell
terraform destroy
```
