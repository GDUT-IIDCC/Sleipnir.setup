# bash配置

本部分包含常用`别名`和`命令行补全`，`bash拓展函数`

## 别名

- 添加命令行alias

```bash
$ cat ./alias.sh >> ~/.bashrc
```

## 代码补全

### conda

```bash
$ conda install -c conda-forge conda-bash-completion
```

放置于`~/.bashrc`

```bash
# <<< conda completition <<<
CONDA_ROOT="${HOME}"/anaconda3
if [[ -r $CONDA_ROOT/etc/profile.d/bash_completion.sh ]]; then
    source $CONDA_ROOT/etc/profile.d/bash_completion.sh
fi
```

## 拓展函数

### [catkin](https://catkin-tools.readthedocs.io/en/latest/advanced/catkin_shell_verbs.html)

目前提供的支持为`catkin cd`（基本等价于`roscd`）和`catkin source` ；用处暂时不大，无代码补全

```bash
$ source $(catkin locate --shell-verbs)
```

