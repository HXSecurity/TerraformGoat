# Description

English | [中文](./README_CN.md)

This is a script that can help you quickly build bucket objects to traverse the scene

## Deployment Environment

```bash
cd /TerraformGoat/Aws/bucket_object_traversal/
```

![image-20220424181052943](../../../images/UzJuMarkDownImageimage-20220424181052943.png)

```bash
terraform init
```

![image-20220424181132510](../../../images/UzJuMarkDownImageimage-20220424181132510.png)

```bash
vim terraform.tfvars
```

![image-20220424181212853](../../../images/UzJuMarkDownImageimage-20220424181212853.png)

Write your AWS IAM user ID and key here

```bash
terraform apply
```

![image-20220424181300550](../../../images/UzJuMarkDownImageimage-20220424181300550.png)

How you confirm that there are no problems？Just type yes and then you can go make a cup of coffee, it will be built and finished before you come back, because it's very fast!

![image-20220424181318245](../../../images/UzJuMarkDownImageimage-20220424181318245.png)

Now Go Get Flag

## Destruction Challenge

```bash
terraform destroy
```

![image-20220424181701610](../../../images/UzJuMarkDownImageimage-20220424181701610.png)

type yes

![image-20220424181723375](../../../images/UzJuMarkDownImageimage-20220424181723375.png)

goOoOoOd by~~~
