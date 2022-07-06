#!/bin/bash
function deploy_k8s(){
  export KKZONE=cn

  # /root/kk 已经通过terrraform provisioner拷贝主机
  chmod 755 /root/kk

  apt-get update -y
  apt-get install -y conntrack ebtables socat

  /root/kk create cluster --with-kubernetes v1.21.5 -y
}

# apiverser没有任何身份认证
function deploy_vuln_apiserver(){
  # 备份
  apiserver_config_path=/etc/kubernetes/manifests/kube-apiserver.yaml
  command_path=/usr/local/bin/kube-apiserver

  cp $apiserver_config_path /root/kube-apiserver.yaml

  # 修改apiserver 配置

  sed -i '/secure-port=\(.*\)/a\ \ \ \ -\ --insecure-port=8443' $apiserver_config_path
  sed -i '/secure-port=\(.*\)/a\ \ \ \ -\ --insecure-bind-address=0.0.0.0' $apiserver_config_path
  echo "[done] '$apiserver_config_path' change"



  # 重新启动apiserver
  systemctl restart kube-apiserver
  # echo "$command_path"
  #pkill -f "$command_path"
  sleep 7
  ps aux| grep "$command_path"
  setsid $command_path &
  echo "[done] 'apiserver' restart"


  #将"system:anonymous"用户绑定到"cluster-admin"用户组
  kubectl create clusterrolebinding cluster-system-anonymous --clusterrole=cluster-admin --user=system:anonymous

  echo "[done] 'anonymous cluster-admin ' create"
}


deploy_k8s
echo "[done] 'k8s cluster' deploy" && sleep 60
deploy_vuln_apiserver
