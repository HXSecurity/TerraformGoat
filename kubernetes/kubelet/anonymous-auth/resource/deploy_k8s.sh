#!/bin/bash
function deploy_k8s(){
  export KKZONE=cn

  # /root/kk 已经通过terrraform provisioner拷贝主机
  chmod 755 /root/kk

  apt-get update -y
  apt-get install -y conntrack ebtables socat

  /root/kk create cluster --with-kubernetes v1.21.5 -y
}

# kubelet未授权访问
function deploy_vuln_kubelet(){
  kubelet_config_path=/var/lib/kubelet/config.yaml

  # 修改配置
  sed -i 's/enabled: false/enabled: true/' $kubelet_config_path
  sed -i 's/mode: Webhook/mode: AlwaysAllow/' $kubelet_config_path
  echo "[done] '$kubelet_config_path' change"

  # 重启服务
  service kubelet restart
  sleep 2
  echo "[done] 'kubelet service' restart"
}

deploy_k8s
echo "[done] 'k8s cluster' deploy" && sleep 60
deploy_vuln_kubelet
