## Use Of Type

使用这个文件中的方法可以进行`AD-Hoc`命令的执行，并且能够快速寻找到执行命令的模版命令。从而使处理任务的效率提升。@包括：shell 命令执行、scripts 脚本执行、copy 文件下发等基本操作

```bash
# shell 命令执行模版
$ ansible -i inventorys/hosts_machines machines -m shell -a 'COMMAND'

# scripts 脚本执行模版
$ ansible -i inventorys/hosts_machines machines -m script -a 'chdir=/tmp SCRIPTNAME'

# copy 文件下发模版
$ ansible -i inventorys/hosts_machines machines -m copy -a 'src=? dest=?'
```

更多模版信息后续随着使用会有所增加。
