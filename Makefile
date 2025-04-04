run:
	chdir ./ansible && \
	uv run -- ansible-playbook -i inventory.ini "$(play).yml"

list:
	chdir ansible && echo "***************************** \\n**** Available Playbooks ****\\n*****************************" && ls | grep ".yml"
