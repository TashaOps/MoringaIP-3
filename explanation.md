# Vagrant setup
After installing vagrant I added ubuntu 20.04 box:
```ruby
vagrant box add geerlingguy/ubuntu2004
```

I initialized the vagrant file which created **Vagrantfile
**
I set vagrant privision for ansible:

```ruby
config.vm.provision "ansible" do |ansible|
 ansible.playbook = "playbook.yml"
```
 end
 
I created hosts file in the current directory with Vagrantfile.hosts file contains the servers ip addresses in this case our vagrant vm IP address 127.0.0.1

I created **ansible.cfg**which is a configurations file that contains our defaults settings we need to connect to our hosts.

I created the **roles** folder which contains our tasks to deploy our applications executed by the playbook.yml file.

After creating roles, I populated each with a **main.yml file**.

I then created **the playbook.yml** in the root directory of the project.

Then proceeded to deploy the app.


