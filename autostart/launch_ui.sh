#!/bin/bash

log_dir="${HOME}/log.Sleipnir"
file_dir="${log_dir}/${time_prefix}-debug.log"
time_prefix=$(date '+%m-%d-%H-%M')
conda activate sleipnir
source ~/Sleipnir/devel/setup.bash
# 若不存在，则建日志文件夹
test -d ${log_dir} || mkdir ${log_dir}
echo -e "\e[32m日志信息将保存到${file_dir}下\e[0m" | cowthink -f duck
rosrun gui ui.py 2>&1 | tee ${file_dir}
