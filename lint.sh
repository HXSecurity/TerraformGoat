#!/bin/bash
echo "--------------------start to format terraform files--------------------"
terraform fmt -recursive
echo "--------------------finished format terraform files--------------------"
echo "--------------------start to format markdown files--------------------"
markdownlint ./  -c .markdownlint.yaml
echo "--------------------finished format markdown files--------------------"
