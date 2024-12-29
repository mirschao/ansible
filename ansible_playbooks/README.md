## Playbooks

此目录中的文件用于执行 playbook 完成相对复杂的任务流程，从而满足自定义的变更发布流程。整体目录的结构采用`roles`角色的方式对各个单一功能任务进行执行，项目有统一的执行入口`site.yml`。可以遵循下方的执行方式：

```bash
# 执行模版
$ ansible-playbook -i inventorys/hosts_machines -e group_name='machines' site.yml -t [TAG]
```

下面是增加对应角色任务的方式：
```bash
# 执行脚本增加角色
$ bash add_roles.sh [ROLE_NAME]

# 进入对应的角色目录，对任务进行编辑
$ cd roles/[ROLE_NAME]
$ tree

```