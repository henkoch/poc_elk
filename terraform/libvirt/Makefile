all: private_ansible_cloud_init.pub
	terraform apply -var project_tag="base"

private_ansible_cloud_init.pub:
	ssh-keygen -q -b 4096 -t rsa -N '' -f private_ansible_cloud_init

base:
	sudo ./virt-cloud-builder.sh

clean:
	- terraform destroy -auto-approve
