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
function deploy_vuln_dashboard(){
  # 备份
  apiserver_config_path=/etc/kubernetes/manifests/kube-apiserver.yaml
  command_path=/usr/local/bin/kube-apiserver


  #安装dashborad
  curl https://raw.githubusercontent.com/kubernetes/dashboard/v2.5.0/aio/deploy/recommended.yaml -o ~/recommended.yaml

  #将"system:anonymous"用户绑定到"cluster-admin"用户组
  kubectl create clusterrolebinding system:anonymous --clusterrole=cluster-admin --user=system:anonymous
  echo "[done] 'anonymous cluster-admin ' create"

  # 修改apiserver 配置
  sed -i '/auto-generate-certificates/a\ \ \ \ -\ --enable-skip-login/' ~/recommended.yaml
  echo "[done] dashboard config change"
  kubectl apply -f ~/recommended.yaml
  sleep 6
  #打开 dashboard （默认端口 8001）
  #http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
  kubectl proxy &
  sleep 3
  echo "[done] 'dashborad' restart"
}


deploy_k8s
echo "[done] 'k8s cluster' deploy" && sleep 60
deploy_vuln_dashboard
