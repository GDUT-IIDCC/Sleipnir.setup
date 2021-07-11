# --
# 有关history命令行的相关配置
# --

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# 添加别名
alias h='history'

# 输出的信息中添加时间信息、用户名信息
HISTTIMEFORMAT="$(whoami) [%F %T] "

# 安装hstr(一个在线搜索历史命令的辅助工具)【有命令行收藏夹功能】
# @ref https://github.com/dvorka/hstr/blob/master/INSTALLATION.md#ubuntu
sudo add-apt-repository ppa:ultradvorka/ppa && sudo apt-get update && sudo apt-get install hstr && hstr --show-configuration >> ~/.bashrc && . ~/.bashrc
