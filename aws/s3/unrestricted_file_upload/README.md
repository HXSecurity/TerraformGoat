# Description

English | [中文](./README_CN.md)

This is a script that can help you quickly build a bucket arbitrary file overwrite scene

## Deployment environment

```bash
cd /TerraformGoat/aws/s3/unrestricted_file_upload/
```

![image](../../../images/UzJuMarkDownImageimage-20220426122100745.png)

Configure AWS Access Credentials

```shell
aws configure
```

> You can see the access key in the AWS [Console --> Security Credentials]

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

Access to the storage bucket we built

![image-20220426122407418](../../../images/image-20220426122407418.png)

![image-20220426122453542](../../../images/image-20220426122453542.png)

We can upload any file on this bucket

![image-20220426143627488](../../../images/image-20220426143627488.png)

![image-20220426143639149](../../../images/image-20220426143639149.png)

## Destruction Challenge

```bash
terraform destroy
```

![image-20220426122633164](../../../images/image-20220426122633164.png)

Just type yes and wait for it be destroyed
