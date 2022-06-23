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
function deploy_vuln_etcd(){
  # 备份
  apiserver_config_path=/etc/kubernetes/manifests/kube-apiserver.yaml
  etcd_config_path=/etc/etcd.env
  command_path=/usr/local/bin/etcd
  etcd_cert_dir="\/etc\/ssl\/etcd\/ssl"

  cp $apiserver_config_path /root/kube-apiserver.yaml
  cp $etcd_config_path /root/etcd.env

  # 修改etcd tls配置
  sed -i 's/ETCD_TRUSTED_CA_FILE=\(.*\)/ETCD_TRUSTED_CA_FILE=\/root\/ca.crt/' $etcd_config_path
  sed -i 's/ETCD_CERT_FILE=\(.*\)/ETCD_CERT_FILE=\/root\/server.crt/' $etcd_config_path
  sed -i 's/ETCD_KEY_FILE=\(.*\)/ETCD_KEY_FILE=\/root\/server.key/' $etcd_config_path
  #sed -i 's/ETCD_CLIENT_CERT_AUTH=true/ETCD_CLIENT_CERT_AUTH=false/' $etcd_config_path

  echo "[done] '$etcd_config_path' change"

  # 重新启动etcd进程
  export $(cat $etcd_config_path | grep -v '#' | xargs)

  # echo "$command_path"
  pkill -f "$command_path"
  sleep 1
  ps aux| grep "$command_path"
  setsid $command_path &

  echo "[done] 'etcd' restart"

  # 证书复制到kube-apiserver容器会挂载的目录中
  copy_cert ca.crt
  copy_cert server.crt
  copy_cert server.key

  # 修改etcd配置,重新启动apiserver进程
  sed -i "s/--etcd-cafile=\(.*\)/--etcd-cafile=$etcd_cert_dir\/ca.crt/" $apiserver_config_path
  sed -i "s/--etcd-certfile=\(.*\)/--etcd-certfile=$etcd_cert_dir\/server.crt/" $apiserver_config_path
  sed -i "s/--etcd-keyfile=\(.*\)/--etcd-keyfile=$etcd_cert_dir\/server.key/" $apiserver_config_path
  sed -i "s/--etcd-servers=https:\/\/.*:2379/--etcd-servers=https:\/\/127.0.0.1:2379/" $apiserver_config_path # 证书SAN中ip只有127.0.0.1

  echo "[done] '$apiserver_config_path' change"

  # 开启etcd grpc-proxy服务
  # nohup $command_path grpc-proxy start --cert /root/server.crt --key /root/server.key --cacert /root/ca.crt --endpoints=0.0.0.0:2379 --insecure-skip-tls-verify --advertise-client-url 0.0.0.0:23790 --listen-addr 0.0.0.0:23790 2>&1 1>/tmp/nohup &
  echo '*/1 * * * * /usr/local/bin/etcd grpc-proxy start --cert /root/server.crt --key /root/server.key --cacert /root/ca.crt --endpoints=0.0.0.0:2379 --insecure-skip-tls-verify --advertise-client-url 0.0.0.0:23790 --listen-addr 0.0.0.0:23790 2>&1 1>>/tmp/nohup' > /tmp/crontab
  crontab /tmp/crontab

  sleep 60
  echo "[done] 'etcd grpc-proxy' create"
}

function copy_cert(){
  host=/root/
  dst=/etc/ssl/etcd/ssl/
  cp -f $host/$1 $dst/$1
}

deploy_k8s
echo "[done] 'k8s cluster' deploy" && sleep 60
deploy_vuln_etcd
