#!/bin/bash
export TF_PLUGIN_CACHE_DIR=~/tf_plugin_cache_dir/.terraform.d/plugin-cache

mkdir -p ${TF_PLUGIN_CACHE_DIR}

function execute(){
    sh -c "$1" 1>/dev/null 
    if [ $? != 0 ]; then
        echo "[$1]failed!"
        exit 1
    else
        echo "[$1] success!"
    fi
}

echo "--------------------start to format terraform files--------------------"
execute  "terraform fmt -recursive"
echo "--------------------finished format terraform files--------------------"

echo "--------------------start to validate terraform files--------------------"
execute  "find . -name '*.tf'  -print | xargs  dirname | uniq | time xargs -n 1 -I{}  sh -c 'terraform -chdir={} init && terraform -chdir={} validate'"
echo "--------------------finished validate terraform files--------------------"

echo "--------------------start to format markdown files--------------------"
execute  "markdownlint ./  -c .markdownlint.yaml"
echo "--------------------finished format markdown files--------------------"





