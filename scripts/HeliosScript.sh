#!/bin/bash

catkin_log() {
    pkg_name=$1
    cd "$(catkin locate -L)"/"${pkg_name}"/
}

# 配置conda
CONDA_ROOT="${HOME}/anaconda3"
if [[ -r $CONDA_ROOT/etc/profile.d/bash_completion.sh ]]; then
    source $CONDA_ROOT/etc/profile.d/bash_completion.sh
fi

# 配置深度学习环境
CUDA_PATH=/usr/local/cuda/bin
CUDA_LIB_PATH=/usr/local/cuda/lib64
TENSORRT_LIB_PATH=${HOME}/application/TensorRT-8.2.2.1/lib
export PATH=${PATH}:${CUDA_PATH}:${NPM_GLOBAL_PATH}
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${CUDA_LIB_PATH}:${TENSORRT_LIB_PATH}

# 配置go语言环境
export GOPATH=${HOME}/application/go
export PATH=$PATH:${HOME}/application/go/bin

# 配置ros
source /opt/ros/noetic/setup.bash

# 配置硬件资源
alias free_c='sudo cpufreq-set -g performance'
alias free_m='sync && sudo bash -c "echo 3 > /proc/sys/vm/drop_caches"'

# 配置自动补全（catkin）
source $(catkin locate --shell-verbs)

# 配置命令行搜索
alias hh=hstr                    # hh to be alias for hstr
export HSTR_CONFIG=hicolor       # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# ensure synchronization between bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi

# 配置历史记录
alias h='history' && HISTTIMEFORMAT="$(whoami) [%F %T] "

# 工程配置
#export CC="gethost --server ah_chung distcc"
#export PATH=/usr/lib/distcc:$PATH
export PATH="${HOME}/.local/bin:$PATH"
alias cslei='conda activate sleipnir'
alias slei="source ~/Sleipnir/devel/setup.bash"

# 配置远程连接
alias connect='ssh ah_chung@10.23.21.110'
TURBOVNC="/opt/TurboVNC/bin"
export PATH="${TURBOVNC}:$PATH"

# 配置latex环境
export MANPATH=${MAT_PATH}:"/usr/local/texlive/2022/texmf-dist/doc/man"
export INFOPATH=${INFOPATH}:"/usr/local/texlive/2022/texmf-dist/doc/info"
export PATH=${PATH}:"/usr/local/texlive/2022/bin/x86_64-linux"


# common command alias
alias logout="qdbus org.kde.ksmserver /KSMServer logout 1 0 3"

alias gdb="gdb -q"
alias kj='killall -s 9 java'
alias rm='rm -i'
