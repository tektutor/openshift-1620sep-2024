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
