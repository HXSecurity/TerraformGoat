#!/bin/bash
echo "--------------------start to format terraform files--------------------"
terraform fmt -recursive
echo "--------------------finished format terraform files--------------------"
echo "--------------------start to format markdown files--------------------"
markdownlint ./  --disable MD013 MD041ls
echo "--------------------finished format markdown files--------------------"
