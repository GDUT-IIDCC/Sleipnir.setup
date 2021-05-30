#!/bin/bash

# Prevent root execution
if [ $(id -u) -eq 0 ]; then
  echo "Don't run as root" >&2
  echo -e "\e[32mEnter any key to exit\e[0m"
  read temp
  exit 1
fi

env_name=$(conda env list | grep '*' | awk 'BEGIN {FS=" "}{print $1'})
if [ ${env_name} != "base" ]; then
  echo "please run in base" >&2
  echo -e "\033[32mEnter any key to exit \033[0m"
  read temp
  exit 0
fi

conda install mamba -c conda-forge -y
mamba env create -f cfg/conda.yaml
