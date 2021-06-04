# 第三方软件自定义配置

## github配置

```bash
# 设置身份验证cache状态 (保持验证状态5min)
$ git config --global credential.help 'cache --timeout 300'
# 取消cache状态
$ git config --global unset credential.help

# 配置commit时的IDx信息
$ git config --global user.name  "spongebob"
$ git config --global user.email "spongebob@mail2.gdut.edu.cn"
```

