#!/bin/bash
mkdir tmp
cd tmp
echo -e "\e[34m
Welcome to TerraformGoat"
read -p "
0. skip
1. Tencent Cloud
2. Alibaba Cloud
3. Huawei Cloud
4. Amazon Web Services
5. Google Cloud Platform
6. Microsoft Azure

Choose the cloud service you will use: " cloudcli

if [ $cloudcli -eq 0 ];then
    # Skip
    echo -e "\e[33m
If you need to install the cloud service command line tool, please run the [bash /install_cloud_cli.sh] command.
"
elif [ $cloudcli -eq 1 ];then
    # Tencent Cloud Cli
    # apt install -qy python3-pip
    # pip install tccli -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
    echo -e "\e[32m
Dependency installation is complete."
elif [ $cloudcli -eq 2 ];then
    # Alibaba Cloud Cli
    apt-get install -qy wget
    wget "https://aliyuncli.alicdn.com/aliyun-cli-linux-3.0.32-amd64.tgz"
    tar xzvf aliyun-cli-linux-3.0.32-amd64.tgz
    cp aliyun /usr/local/bin
    echo -e "\e[32m
Dependency installation is complete."
elif [ $cloudcli -eq 3 ];then
    # Huawei Cloud Cli
    curl -sSL https://hwcloudcli.obs.cn-north-1.myhuaweicloud.com/cli/latest/hcloud_install.sh -o ./hcloud_install.sh && bash ./hcloud_install.sh -y
    echo -e "\e[32m
Dependency installation is complete."
elif [ $cloudcli -eq 4 ];then
    # Amazon Web Services Cli
    apt-get install -qy unzip
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    ./aws/install
    echo -e "\e[32m
Dependency installation is complete."
elif [ $cloudcli -eq 5 ];then
    # Google Cloud Platform Cli
    curl -O "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-377.0.0-linux-x86_64.tar.gz"
    tar -xf google-cloud-sdk-377.0.0-linux-x86_64.tar.gz
    N y /root/.bashrc | ./google-cloud-sdk/install.sh
    echo -e "\e[32m
Dependency installation is complete, Enter 0 to skip."
    source ~/.bashrc
elif [ $cloudcli -eq 6 ];then
    # Microsoft Azure Cli
    curl -sL https://aka.ms/InstallAzureCLIDeb | bash
    echo -e "\e[32m
Dependency installation is complete."
else 
    echo -e "\e[31m
Input error, please check and run the install_cloud_cli.sh script again."
fi
cd ..