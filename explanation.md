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

 end
```

I created **ansible.cfg** which is a configurations file that contains our defaults settings we need to connect to our hosts.

I created the **roles** folder which contains our tasks to deploy our applications executed by the playbook.yml file.

After creating roles, I populated each with a **main.yml file**, each stating its own ansible tasks.

I then created **playbook.yml** in the root directory of the project, this file included the roles stated above.

Then proceeded to deploy the app.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

Choice of the Kubernetes Objects used for deployment (Use of - or the lack of use - of StatefulSets for storage solutions).
    - StatefulSets: StatefulSets are used for the deployment of MongoDB, which requires persistent storage. StatefulSets are used to ensure that the MongoDB pods are deployed in a predictable and ordered manner, with each pod having a unique and stable hostname. 
    - Persistent Volumes: Persistent Volumes (PVs) are used to provide persistent storage for StatefulSets. In the code, a mongodb-data volume claim template is defined for the MongoDB StatefulSet, 

Method used to expose your pods to internet traffic.
    - The client-service is defined with port: 80 and targetPort: 3000, which exposes the pod running the client application on port 80. Similarly, the backend-service is defined with port: 80 and targetPort: 5000, which exposes the pod running the backend application on port 80. The mongodb-service is defined with port: 27017 and targetPort: 27017, which exposes the pod running MongoDB on port 27017.

Use-of or there-lack-of of persistent storage
    - StatefulSet is used to deploy the MongoDB application, which includes the definition of a mongodb-statefulset that specifies a volumeClaimTemplate for persistent storage. This volumeClaimTemplate is used to dynamically create PersistentVolumeClaims (PVCs) for each replica of the MongoDB StatefulSet. The PVCs are bound to available PersistentVolumes (PVs) in the cluster, providing persistent storage for the MongoDB data. This ensures that the data stored in MongoDB persists even if the pod or node where MongoDB is running fails or is rescheduled to a different nod.




