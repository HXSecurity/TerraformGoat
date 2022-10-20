FROM ubuntu:20.04 AS aliyun
LABEL maintainer="HXSecurity research lab <https://github.com/HXSecurity>"
COPY . /TerraformGoat
RUN apt-get update -y && \
    apt-get -yq --no-install-recommends install gnupg2 groff less lsb-release software-properties-common curl vim wget && \
    curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - 2>/dev/null && \
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    apt-get update && \
    apt-get -yq --no-install-recommends install terraform && \
    apt-get clean && \
    apt-get autoclean && \
    echo "plugin_cache_dir = \"$HOME/.terraform.d/plugin-cache\"" > ~/.terraformrc && \
    mkdir -p $HOME/.terraform.d/plugin-cache && \
    cd /TerraformGoat/aliyun/oss/bucket_http_enable && terraform init && \
    wget "https://github.com/aliyun/aliyun-cli/releases/download/v3.0.131/aliyun-cli-linux-3.0.131-amd64.tgz" && \
    tar xzvf aliyun-cli-linux-3.0.131-amd64.tgz && \
    cp aliyun /usr/local/bin && \
    echo "bash init.sh" >> ~/.bashrc
WORKDIR /TerraformGoat

FROM ubuntu:20.04 AS tencentcloud
LABEL maintainer="HXSecurity research lab <https://github.com/HXSecurity>"
COPY . /TerraformGoat
RUN apt-get update -y && \
    apt-get -yq --no-install-recommends install curl gnupg2 groff less lsb-release python3-pip software-properties-common vim && \
    curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - 2>/dev/null && \
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    apt-get update && \
    apt-get -yq --no-install-recommends install terraform && \
    apt-get clean && \
    apt-get autoclean && \
    echo "plugin_cache_dir = \"$HOME/.terraform.d/plugin-cache\"" > ~/.terraformrc && \
    mkdir -p $HOME/.terraform.d/plugin-cache && \
    cd /TerraformGoat/tencentcloud/cos/bucket_acl_readable && terraform init && \
    pip install tccli && \
    echo "bash init.sh" >> ~/.bashrc
WORKDIR /TerraformGoat

FROM ubuntu:20.04 AS huaweicloud
LABEL maintainer="HXSecurity research lab <https://github.com/HXSecurity>"
COPY . /TerraformGoat
RUN apt-get update -y && \
    apt-get -yq --no-install-recommends install gnupg2 groff less lsb-release software-properties-common curl vim && \
    curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - 2>/dev/null && \
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    apt-get update && \
    apt-get -yq --no-install-recommends install terraform && \
    apt-get clean && \
    apt-get autoclean && \
    echo "plugin_cache_dir = \"$HOME/.terraform.d/plugin-cache\"" > ~/.terraformrc && \
    mkdir -p $HOME/.terraform.d/plugin-cache && \
    cd /TerraformGoat/huaweicloud/obs/bucket_object_traversal && terraform init && \
    curl -sSL https://hwcloudcli.obs.cn-north-1.myhuaweicloud.com/cli/latest/hcloud_install.sh -o ./hcloud_install.sh && echo "y" | bash ./hcloud_install.sh -y && \
    echo "bash init.sh" >> ~/.bashrc
WORKDIR /TerraformGoat

FROM ubuntu:20.04 AS aws
LABEL maintainer="HXSecurity research lab <https://github.com/HXSecurity>"
COPY . /TerraformGoat
RUN apt-get update -y && \
    apt-get -yq --no-install-recommends install gnupg2 groff less lsb-release software-properties-common curl unzip vim && \
    curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - 2>/dev/null && \
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    apt-get update && \
    apt-get -yq --no-install-recommends install terraform && \
    apt-get clean && \
    apt-get autoclean && \
    echo "plugin_cache_dir = \"$HOME/.terraform.d/plugin-cache\"" > ~/.terraformrc && \
    mkdir -p $HOME/.terraform.d/plugin-cache && \
    cd /TerraformGoat/aws/s3/bucket_acl_readable && terraform init && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    echo "bash init.sh" >> ~/.bashrc
WORKDIR /TerraformGoat

FROM ubuntu:20.04 AS gcp
LABEL maintainer="HXSecurity research lab <https://github.com/HXSecurity>"
COPY . /TerraformGoat
RUN apt-get update -y && \
    apt-get -yq --no-install-recommends install gnupg2 groff less lsb-release software-properties-common curl vim && \
    curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - 2>/dev/null && \
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    apt-get update && \
    apt-get -yq --no-install-recommends install terraform && \
    apt-get clean && \
    apt-get autoclean && \
    echo "plugin_cache_dir = \"$HOME/.terraform.d/plugin-cache\"" > ~/.terraformrc && \
    mkdir -p $HOME/.terraform.d/plugin-cache && \
    cd /TerraformGoat/gcp/cs/bucket_acl_writable && terraform init && \
    curl -O "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-377.0.0-linux-x86_64.tar.gz" && \
    tar -xf google-cloud-sdk-377.0.0-linux-x86_64.tar.gz && \
    N y /root/.bashrc | ./google-cloud-sdk/install.sh && \
    echo "bash init.sh" >> ~/.bashrc
WORKDIR /TerraformGoat

FROM ubuntu:20.04 AS azure
LABEL maintainer="HXSecurity research lab <https://github.com/HXSecurity>"
COPY . /TerraformGoat
RUN apt-get update -y && \
    apt-get -yq --no-install-recommends install gnupg2 groff less lsb-release software-properties-common curl vim && \
    curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - 2>/dev/null && \
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    apt-get update && \
    apt-get -yq --no-install-recommends install terraform && \
    apt-get clean && \
    apt-get autoclean && \
    echo "plugin_cache_dir = \"$HOME/.terraform.d/plugin-cache\"" > ~/.terraformrc && \
    mkdir -p $HOME/.terraform.d/plugin-cache && \
    cd /TerraformGoat/azure/blob/blob_public_access && terraform init && \
    curl -sL https://aka.ms/InstallAzureCLIDeb | bash && \
    echo "bash init.sh" >> ~/.bashrc
WORKDIR /TerraformGoat
