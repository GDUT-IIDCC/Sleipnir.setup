#!/bin/bash
conda activate sleipnir
pip install pip -U
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
pip install -r cfg/pypi.yaml
