- name: Provision infrastructure with Terraform
  hosts: any
  become: true

  tasks:
    - name: Initialize Terraform
      command: terraform init "{{ app_path }}/Stage_two"

    - name: Apply Terraform plan
      command: terraform apply -auto-approve -var "app_name={{ app_name }}" -var "region={{ region }}" -var "instance_type={{ instance_type }}" -var "mongodb_port={{ mongodb_port }}" -var "webapp_port={{ webapp_port }}" "{{ app_path }}/terraform"

    - name: Retrieve instance IP address
      command: terraform output -json instance_ip_address
      register: instance_ip_address_raw

    - name: Set instance IP address as Ansible host
      add_host:
        name: "{{ instance_ip_address_raw.stdout | from_json }}"
        ansible_user: "ubuntu"
        ansible_ssh_private_key_file: "{{ lookup('env', 'HOME') }}/.ssh/id_rsa"