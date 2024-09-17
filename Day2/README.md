# Day 2

## Kubelet Overview
<pre>
- Kubelet is a Container agent that runs as a service in every node 
- Kubelet is the one that communicates with CRI-O container runtime to mange images and containers
</pre>  


## Pod Overview
<pre>
- Logical grouping of containers
- containers is where our application will be running
</pre>  

## Info - Control Plane Components
<pre>
1. API Server
2. etcd database
3. scheduler
4. controller managers
</pre>  

## API Server Overview
<pre>
- is the heart of Kubernetes/Openshift
- is a Pod that runs in every master node
- API Server has REST APIs for every features supported in Openshift
- API Server stores cluster status and application staus in the etcd database
- API Server is the only component that writes information to the etcd database
- all the Openshift components they only communicate with API Server via REST calls
</pre>

## etcd 
<pre>
- key/value distributed datastore
- is a Pod that runs in every master node
- opensource independent project  
- many etcd instances run as a cluster
- when one instance of etcd database is updated, the other etcd databases in the cluster gets synchronized
</pre>

## Scheduler
<pre>
- Scheduler is a Pod that runs in every master node   
- responsible for scheduling new pods into any one of the health node within openshift cluster
- its gets notifications from API Server when new Pods are created
- scheduler can't schedule pod directly, it will just send its scheduling recommendations to API Server via REST calls
</pre>

## Controller Managers
<pre>
- a group of controllers
- is a collection of many 
- is a Pod that runs in every master node
- controller is an application that runs in a never ending while loop 
- each controller manages one type of Openshift resource
- For example
  - Deployment Controller manages Deployment
  - ReplicaSet Controller manages ReplicaSet
  - Job Controller manages Jobs
  - CronJob Controller manages CronJobs
  - StatefulSet Controller manages StatefulSet
  - DaemonSet Controller manager DaemonSet
  - Endpoint Controller manages Pod endpoints used in services
</pre>

## Info - What happens when we create a new deploy in openshift
```
oc create deployment nginx --image=bitnami/nginx:latest --replicas=3
```

The below chain of activity happens
<pre>
- oc client tool makes a REST call to API server,request to create new deployment with name nginx
- API server receives the request from oc client tool, it then creates a Deployment record in etcd database
- API then sends a broadcasting event saying a new nginx deployment is created
- Deployment Controller receives the event from API server, it then requests the API server to create a replicaset for the nginx deployment
- API Server receives the request from Deployment Controller, it then creates a ReplicaSet record in etcd database
- API Server sends a broadcasting event saying a new nginx replicaset is created
- ReplicaSet Controller receives the event from API Server, it then requests the API Server via REST call to create 3 Pods
- API Server create 3 Pods entries(records) in etcd database
- API Server sends a broadcasting event saying new Pod created. This kind of event will be broadcasted for every Pod.
- Scheduler receives the event, it then identifies a healthy node where the new Pod can be deployed. Scheduler sends its scheduling recommendataions to API Server via REST Call
- API Server, retrieves the existing Pod entries from etcd database and it updates the Pod with the new scheduling information
- API Server then sends broadcasting events saying Pod scheduled to so and so node(s), this would be repeated for every Pod
- In case a Pod is scheduled to worker1, the kubelet service running in worker will receive the event from API Server, it then checks if the respective container image is present in the local node, if not will request CRI-O container runtime to download the image. Once the image is download, kubelet creates the containers required by the Pod with the respective container image. 
- kubelet monitors the status of the containers running locally, it then frequently like a heart-beat it keeps updating the status to API Server via REST calls
- API server receives the kubelet status updates, it then updates the Pod status in the etcd database
</pre>
