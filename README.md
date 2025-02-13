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

1. Run the miniconda install script

`sh inst_miniconda.sh`

config: disable conda from auto enabling


2. Create a new conda env for Ansible and enable env

```
conda create --name ansible
```

Enabling 

pre: Initialise conda if it's turned off as per above config instruction

```
conda activate ansible
```

3. Install Ansible core within that env

> Minimal version of Ansible, but the playbooks here don't use Galaxy modules

```shell
python3 -m pip install --user ansible-core

```

## Run 

Runtime uses Makefile commands

> Run `xyz` playbook

Each playbook can be passed in using `play` env variable. 

eg. play="go" -> running the go.yml playbook

1. Check available playbook

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

