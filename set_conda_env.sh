#!/bin/bash
cp cfg/tsinghua_conda_cfg ~/.condarc
conda deactivate
conda env create -f cfg/conda.yaml
