#!/bin/bash

# Prevent root execution
if [ $(id -u) -eq 0 ]; then
  echo "Don't run as root" >&2
  exit 1
fi
conda install mamba -c conda-forge
mamba env create -f cfg/conda.yaml
