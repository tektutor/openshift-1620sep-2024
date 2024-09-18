# Day 3

## Lab - Creating a ClusterIP Internal service for nginx deployment

Let's first delete the nginx node-port service
```
oc get svc
oc delete svc/nginx
```

Let's create a nginx deployment with 3 pods if you don't have it already
```
oc project jegan
oc create deploy nginx --image=bitnami/nginx:latest --replicas=3
oc expose deploy/nginx --type=ClusterIP --port=8080
oc get svc
oc describe svc/nginx
oc get po -o wide
```

In order to access the clusterip internal service, let's create a test pod
```
oc run test-pod --image=tektutor/spring-ms:1.0
oc get po
oc rsh pod/test-pod sh
curl http://nginx:8080
curl http://<service-name>:<service-port>
curl http://10.217.5.158:8080
curl http://<service-ip>:<service-port>
```

Expected output
![image](https://github.com/user-attachments/assets/3020315d-0af3-45e1-9c04-cd33ecf7e6b1)
![image](https://github.com/user-attachments/assets/f252d0ce-650f-480e-89bb-28eff57ddb7d)
![image](https://github.com/user-attachments/assets/8c552613-2446-49cc-9c9f-0137b39656c9)
![image](https://github.com/user-attachments/assets/ac6d19ee-2db3-45ec-a623-7120ec76e40e)
![image](https://github.com/user-attachments/assets/f971fb95-3acd-4167-a1b5-9bdbf164d612)
![image](https://github.com/user-attachments/assets/8f414317-ac49-4464-8559-798fcea32f4f)

## Info - Metallb Operator
<pre>
https://medium.com/tektutor/using-metallb-loadbalancer-with-bare-metal-openshift-onprem-4230944bfa35  
</pre>

## Lab - Creating an external route with public url
```
oc get deploy
oc get svc
oc delete svc/nginx
oc expose deploy/nginx --port=8080
oc get svc
oc describe svc/nginx
oc expose svc/nginx
curl http://nginx-jegan.apps-crc.testing
```

Expected output
![image](https://github.com/user-attachments/assets/e0f50e33-4965-48dd-955b-9ecab0375161)
![image](https://github.com/user-attachments/assets/cdf404cb-abf0-4955-881c-cce9c754cf2e)
![image](https://github.com/user-attachments/assets/2172b082-5560-4a7a-a18b-415ad2bc5262)

## Lab - Getting inside a openshift node 
```
oc debug node/crc
chroot /host
crictl ps
podman images
exit
```

## Lab - Creating a loadbalancer service for nginx deployment
```
oc delete svc/nginx
oc expose deploy --type=LoadBalancer --port=8080
oc get svc
oc describe svc/nginx
curl http://<loadbalancer-external-p>
```

