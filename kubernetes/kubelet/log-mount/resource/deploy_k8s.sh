#!/bin/bash
function deploy_k8s(){
  export KKZONE=cn

  # /root/kk 已经通过terrraform provisioner拷贝主机
  chmod 755 /root/kk

  apt-get update -y
  apt-get install -y conntrack ebtables socat

  /root/kk create cluster --with-kubernetes v1.21.5 -y
}

# /var/log挂载漏洞
function deploy_vuln_kubelet(){
  kubectl_bin_path=/usr/local/bin/kubectl
  kubelet_arg_path=/var/lib/kubelet/kubeadm-flags.env
  yaml_path=/root/mount_log.yaml

  # 使用docker网络
  sed -i 's/--network-plugin=cni//' $kubelet_arg_path
  service kubelet restart
  sleep 2
  echo '[done] "kubelet" restart'

  # 部署恶意pod
  $kubectl_bin_path apply -f $yaml_path
  sleep 60
  echo '[done] "busybox" create'

  $kubectl_bin_path logs busybox
  sleep 60
}

deploy_k8s
echo "[done] 'k8s cluster' deploy" && sleep 60
deploy_vuln_kubelet
