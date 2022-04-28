# Description

English | [中文](./README_CN.md)

This is a script that can help you quickly build bucket objects to traverse the scene

After you complete the challenge, you can review the source code to see why this is the case

## Deployment Environment

```bash
cd /TerraformGoat/TenCentCloud/bucket_object_traversal/
```

![image-20220424172434562](../../../images/UzJuMarkDownImageimage-20220424172434562.png)

Edit variables.tf to write your Tencent Cloud security key

```bash
vim terraform.tfvars
```

Tips: There is a string of numbers in the object storage of Tencent Cloud, which comes from the APPID of the account.

![image-20220420142509331](../../../images/UzJuMarkDownImageimage-20220420142509331.png)

You can also manually enter the code after commenting it with #

![image-20220424172800729](../../../images/UzJuMarkDownImageimage-20220424172800729.png)

```bash
terraform init
```

![image-20220420143216521](../../../images/UzJuMarkDownImageimage-20220420143216521.png)

```bash
terraform apply
```

![image-20220424172612699](../../../images/UzJuMarkDownImageimage-20220424172612699.png)

Type the BucketName and type (ps: Bucket name must be lowercase )

![image-20220424172533527](../../../images/UzJuMarkDownImageUzJuMarkDownImageimage-20220424172533527.png)

Check output, if there is no problem, enter yes.

![image-20220424172657516](../../../images/UzJuMarkDownImageimage-20220424172657516.png)

Now you can see that output shows the address of the storage bucket we created with the region, Now Go get flags

## Challenge to destroy

```bash
terraform destory
```

![image-20220427185131878](../../../images/image-20220427185131878.png)

To verify that there is no problem, type Yes

![image-20220424173018520](../../../images/UzJuMarkDownImageimage-20220424173018520.png)

GooOOOOOOOOOOOd Bye~
