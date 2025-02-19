
run:
	. $$(conda info --base)/etc/profile.d/conda.sh && \
	chdir ./ansible && \
	conda run -n $(ANSIBLE_ENV) ansible-playbook -i inventory.ini "$(play).yml"

list:
	chdir ansible && echo "***************************** \\n**** Available Playbooks ****\\n*****************************" && ls | grep ".yml"

run-wo-conda:
	chdir ./ansible && \
	ansible-playbook -i inventory.ini "$(play).yml"
