## Playbooks

此目录包含用于执行 playbook 的文件，以完成复杂的任务流程，满足自定义的变更发布需求。目录结构采用 `roles` 角色方式来执行各个单一功能任务，项目的统一执行入口为 `site.yml`。可以按照以下方式执行：

### 增加角色任务

按照以下步骤增加对应的角色任务：

```bash
# 执行脚本增加角色
$ bash addRoles.sh [ROLE_NAME]

# 进入对应的角色目录，编辑任务
$ cd roles/[ROLE_NAME]
$ tree
.
├── scripts
│   └── NAME.sh
└── tasks
    └── main.yml
```

### 常用命令

执行常用playbook剧本指令及标签:

```bash
# 执行除某个 tag 的任务（谨慎使用!!!）
$ ansible-playbook -i inventorys/hosts_machines -e group_name='machines' site.yml --skip-tags [TAG]

# 执行重启任务
$ ansible-playbook -i inventorys/hosts_machines -e group_name='machines' site.yml --tags reboot

# 执行初始化任务
$ ansible-playbook -i inventorys/hosts_machines -e group_name='machines' site.yml --tags initials
```
