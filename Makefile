update-roles:
	ansible-galaxy install -r requirements.yml --force -p roles

init:
	terraform init

validate-dev:
	terraform validate -var-file=dev.tfvars

validate-stg:
	terraform validate -var-file=stg.tfvars

validate-prd-ec2:
	terraform validate -var-file=prd-ec2.tfvars

validate-prd-ce:
	terraform validate -var-file=prd-ce.tfvars

plan-dev: init validate-dev
	terraform plan --var-file=dev.tfvars

plan-stg: init validate-stg
	terraform plan --var-file=stg.tfvars

plan-prd-ec2: init validate-prd-ec2
	terraform plan --var-file=prd-ec2.tfvars

plan-prd-ce: init validate-prd-ce
	terraform plan --var-file=prd-ce.tfvars

apply-dev:
	terraform apply --var-file=dev.tfvars -auto-approve	&& terraform output ansible_hosts > inventories/dev/inventory.ini
	
apply-stg:
	terraform apply --var-file=stg.tfvars -auto-approve && terraform output ansible_hosts > inventories/stg/inventory.ini	
	
apply-prd-ec2:
	terraform apply --var-file=prd-ec2.tfvars -auto-approve	&& terraform output ansible_hosts > inventories/prd-ec2/inventory.ini	
	
apply-prd-ce:
	terraform apply --var-file=prd-ce.tfvars -auto-approve && terraform output ansible_hosts > inventories/prd-ce/inventory.ini	

destroy-dev:
	terraform destroy -var-file=dev.tfvars -auto-approve

destroy-stg:
	terraform destroy -var-file=stg.tfvars -auto-approve	

destroy-prd-ec2:
	terraform destroy -var-file=prd-ec2.tfvars -auto-approve	

destroy-prd-ce:
	terraform destroy -var-file=prd-ce.tfvars -auto-approve

run-ansible-dev: update-roles
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventories/dev/inventory.ini playbook.yml

run-ansible-stg: update-roles
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventories/stg/inventory.ini playbook.yml

run-ansible-prd-ec2: update-roles
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventories/prd-ec2/inventory.ini playbook.yml

run-ansible-prd-ce: update-roles
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventories/prd-ce/inventory.ini playbook.yml		

plan-all: init validate-dev validate-stg validate-prd-ec2 validate-prd-ce plan-dev plan-stg plan-prd-ec2 plan-prd-ce

apply-all: apply-dev apply-stg apply-prd-ec2 apply-prd-ce

destroy-all: destroy-dev destroy-stg destroy-prd-ec2 destroy-prd-ce

run-ansible-all: run-ansible-dev run-ansible-stg run-ansible-prd-ec2 run-ansible-prd-ce