#!/bin/bash
function deploy_k8s(){
  export KKZONE=cn

  # /root/kk 已经通过terrraform provisioner拷贝主机
  chmod 755 /root/kk

  apt-get update -y
  apt-get install -y conntrack ebtables socat

  /root/kk create cluster --with-kubernetes v1.21.5 -y
}

# etcd没有任何身份认证
function deploy_vuln_etcd1(){
  # 备份
  apiserver_config_path=/etc/kubernetes/manifests/kube-apiserver.yaml
  etcd_config_path=/etc/etcd.env
  command_path=/usr/local/bin/etcd

  cp $apiserver_config_path /root/kube-apiserver.yaml
  cp $etcd_config_path /root/etcd.env

  # 删除tls配置
  sed -i '/ETCD_TRUSTED_CA_FILE/d' $etcd_config_path
  sed -i '/ETCD_CERT_FILE/d' $etcd_config_path
  sed -i '/ETCD_KEY_FILE/d' $etcd_config_path
  sed -i '/ETCD_CLIENT_CERT_AUTH/d' $etcd_config_path

  # 修改https到http
  # 执行两次，因为 ETCD_LISTEN_CLIENT_URLS=https://172.31.14.33:2379,https://127.0.0.1:2379
  sed -i 's/\(.*\)https:\(.*\):2379/\1http:\2:2379/' $etcd_config_path
  sed -i 's/\(.*\)https:\(.*\):2379/\1http:\2:2379/' $etcd_config_path

  echo "[done] '$etcd_config_path' change"

  # 重新启动etcd进程
  export $(cat $etcd_config_path | grep -v '#' | xargs)

  # echo "$command_path"
  pkill -f "$command_path"
  sleep 1
  ps aux| grep "$command_path"
  setsid $command_path &

  echo "[done] 'etcd' restart"

  # 修改配置,重新启动apiserver进程
  sed -i '/--etcd-cafile/d' $apiserver_config_path
  sed -i '/--etcd-certfile/d' $apiserver_config_path
  sed -i '/--etcd-keyfile/d' $apiserver_config_path
  sed -i 's/\(.*\)--etcd-servers=https:\(.*\):2379/\1--etcd-servers=http:\2:2379/' $apiserver_config_path

  echo "[done] '$apiserver_config_path' change"
}

deploy_k8s
echo "[done] 'k8s cluster' deploy" && sleep 60
deploy_vuln_etcd1
