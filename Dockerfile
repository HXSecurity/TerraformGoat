FROM ubuntu:20.04
LABEL maintainer="HuoCorp research lab <https://github.com/HuoCorp>"

RUN apt-get update -y && \
    apt-get install -qy gnupg2 && \  
    apt-get install -qy curl && \
    apt-get install -qy vim && \
    apt-get install -qy lsb-release && \
    apt-get install -qy software-properties-common && \
    curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - 2>/dev/null && \
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    apt-get update && \
    apt-get install terraform && \
    echo "plugin_cache_dir = \"$HOME/.terraform.d/plugin-cache\"" > ~/.terraformrc && \
    mkdir -p $HOME/.terraform.d/plugin-cache && \
    echo "bash install_cloud_cli.sh " >> ~/.bashrc

COPY . /TerraformGoat
WORKDIR /TerraformGoat