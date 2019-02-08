update-roles:
	ansible-galaxy install -r requirements.yml --force -p roles

init:
	terraform init

validate:
	terraform validate	

plan:
	terraform plan

apply:
	terraform apply -auto-approve	

destroy:
	terraform destroy -auto-approve