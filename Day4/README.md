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
- For an Ingress to work we need 3 things
  1. Ingress Forwarding rule
  2. Load Balancer - For example it could nginx load balancer or HAProxy Load Balancer
  3. In case, nginx is used as load balancer in your openshift cluster then, your cluster should have a Nginx Ingress Controller.  Otherwise, you cluster should have a HAProxy Ingress Controller
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

Expected output
![image](https://github.com/user-attachments/assets/26f218cb-1409-497e-acd6-cede01dbe572)
![image](https://github.com/user-attachments/assets/055a075e-68c9-4c7b-ae94-62d4da8de84e)
![image](https://github.com/user-attachments/assets/28ff4415-a017-48ab-983f-a7d0233b3dc7)
![image](https://github.com/user-attachments/assets/42d97edc-4929-4041-87fc-34f061c296a7)
![image](https://github.com/user-attachments/assets/4e03f5b6-c5ac-42d4-a24c-c54098021dd7)
![image](https://github.com/user-attachments/assets/956df887-d85d-45d4-965f-88cf1c2e6ccf)
![image](https://github.com/user-attachments/assets/ae7c108d-1dab-4f64-8cf3-7822deb75b5c)

Let's create ingress ( We need to add tektutor.apps.ocp4.rps.com to /etc/hosts with the crc node ip address )
```
cd ~/openshift-1620sep-2024
git pull
cd Day4/ingress
cat ingress.yml
oc apply -f ingress.yml
oc get ingress
oc describe ingress/tektutor
curl http://tektutor.apps.ocp4.rps.com/nginx
curl http://tektutor.apps.ocp4.rps.com/hello
```

Expected output
![image](https://github.com/user-attachments/assets/3928efb2-8853-430d-9ae0-583b2159241d)
![image](https://github.com/user-attachments/assets/ccba3603-9aeb-4b1c-bdad-3685088ae602)
![image](https://github.com/user-attachments/assets/f4443737-475c-41c5-9bef-e9e4ac1c37e9)
![image](https://github.com/user-attachments/assets/0fdfc101-6683-4ef6-9c5f-347c91af4148)
![image](https://github.com/user-attachments/assets/5a54ddd5-c064-4302-ae85-fbd83c605a21)
![image](https://github.com/user-attachments/assets/9ca5d60d-d649-4766-90f5-42f316bec604)

## Lab - Job

## Lab - CronJob

## Lab - Creating an edge route for nginx deployment
Let's deploy nginx 
```
oc delete project jegan
oc new-project jegan

oc create deployment nginx --image=bitnami/nginx:latest --replicas=3
oc expose deploy/nginx --port=8080
```

Find your base domain of your openshift cluster
```
oc get ingresses.config/cluster -o jsonpath={.spec.domain}
```

Let's generate a private key
```
openssl version
openssl genrsa -out key.key
```

We need to create a public key using the private key for a spcific organization domain
```
openssl req -new -key key.key -out csr.csr -subj="/CN=nginx-jegan.apps.ocp4.rps.com"
```
Sign the public key using the private key and generate a certificate(.crt)
```
openssl x509 -requ -in csr.csr --signkey key.key -out crt.crt
oc create route edge --service nginx --hostname nginx-jegan.apps.ocp4.rps.com --key key.key --cert crt.crt
```

Expected output
