#  开机启动脚本
仅限松灵中型车使用



# Troubleshooting

1. [tee日志输出到终端不及时](https://stackoverflow.com/questions/41026503/tee-output-not-appearing-until-cmd-finishes)

```bash
$ sudo apt install expect
$ conda activate sleipnir
# 解决conda的expect与系统的expect冲突的问题
$ conda install -c eumetsat expect
# 在相关命令行前加上"unbuffer"
```