# Day 4

## Cloning this repository
```
cd ~
git clone https://github.com/tektutor/openshift-1620sep-2024.git
cd openshift-1620sep-2024
```

## Lab - Deploying multipod application with Persistent Storage
```
cd ~/openshift-1620sep-2024
git pull
cd Day4/persistent-volume
./deploy.sh
```

Expected output
![image](https://github.com/user-attachments/assets/501f5c0d-abd7-448c-8a70-e67d269c6669)
![image](https://github.com/user-attachments/assets/f9ffcc92-80dc-4b38-9a8d-4b60f4d6394f)
![image](https://github.com/user-attachments/assets/c85bb351-acae-4535-8be7-24071f560c64)
![image](https://github.com/user-attachments/assets/ae896798-543d-4133-b33f-38fe5de6d0d2)
![image](https://github.com/user-attachments/assets/4880329e-6d10-4226-95a1-cfc01f56a61e)

## Lab - Ingress

#### Things to note
<pre>
- Ingress is forwarding rule
- Ingress is not a service
- Ingress forwards requests to multiple services based on certain rules like url path
- We are going to create two deployment 
  1. nginx deployment with 3 pods and a clusterip service
  2. hello deployment with 3 pods and a clusterip service
</pre>

Let's create nginx deployment
```
oc new-project jegan
oc new-app --name=nginx --image=bitnami/nginx:latest
oc scale deploy/nginx --replicas=3
oc get deploy,rs,po,svc
```

Let's create hello microservice deployment
```
oc new-app --name=hello --image=tektutor/spring-ms:1.0
oc scale deploy/hello --replicas=3
oc get deploy,rs,po,svc
```

Let's create ingress
```
cd ~/openshift-1620sep-2024
git pull
cd Day4/ingress
oc apply -f ingress.yml
```

Expected output
![image](https://github.com/user-attachments/assets/26f218cb-1409-497e-acd6-cede01dbe572)
![image](https://github.com/user-attachments/assets/055a075e-68c9-4c7b-ae94-62d4da8de84e)
![image](https://github.com/user-attachments/assets/28ff4415-a017-48ab-983f-a7d0233b3dc7)
![image](https://github.com/user-attachments/assets/42d97edc-4929-4041-87fc-34f061c296a7)
![image](https://github.com/user-attachments/assets/4e03f5b6-c5ac-42d4-a24c-c54098021dd7)
![image](https://github.com/user-attachments/assets/956df887-d85d-45d4-965f-88cf1c2e6ccf)
