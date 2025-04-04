# Ansible - local stack

> Playbooks for local stack setup. 

To be used in the context of a new environment eg new computer or maintaining an existing computer. 

Should allow for quick device setups that are automated and repeatable.

Features:
- Adds useful apps: git, vim, PrusaSlicer, Okular (pdf reader) etc
- Adds developer dependencies and developer tools 

By using this paradigm, we agree to stop installing things manually, add the *new* thing to this repo

## Pre-requisites

Review [Ansible docs](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-and-upgrading-ansible-with-pip) for updates on docs

1. Install uv

`curl -LsSf https://astral.sh/uv/install.sh | sh`

2. sync uv 

Within the project

`uv sync`

## Run 

Runtime uses Makefile commands

> Run `xyz` playbook

Each playbook can be passed in using `play` env variable. 

1. List available playbooks

```shell
make list
```

2. Run playbook 

```shell
make run play={name_of_play}

```

## Editing

- Add to existing playbooks or create new topical playbooks

## Author

Alan Ionita


## License

GNU Affero General Public License (AGPL)