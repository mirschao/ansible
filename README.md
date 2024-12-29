## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction
This project contains batch scripts and Playbooks for automating tasks related to server hardware, systems config, and kernels.

## Features
- Automated server management
- Hardware monitoring
- System updates
- Kernel patching

## Installation
To install the necessary dependencies, run:
```bash
# apt、yum、dnf package manage same. example:
$ yum -y install ansible

# inside to project directory
$ cd ansible
```

## Usage
To run a playbook, use the following command:
```bash
$ tree -L 1 roles
roles
├── initials
├── ......
├── ......
└── reboot

# this role name & tag name is same, so that write reboot.
$ ansible-playbook -i inventorys/hosts_machines -e group_name='machines' site.yml --tags reboot
```

## Contributing
Contributions are welcome! Please fork the repository and submit a pull request.

## License
This project is licensed under the Apache

 License. See the [LICENSE](LICENSE) file for details.
