# Red Hat Openshift 16 - 20 Sep 2024

# Kindly check if you are able to connect to the RPS Lab Machine
<pre>
- Kindly avoid using the demo rps cloud lab link
- You would have received another link for this week's training
- In case, you don't have access to chat you can let me know your RPS Cloud user, I'll login and check
</pre>

## Pre-test
<pre>
- Once you are able to login to your RPS Cloud lab, you can start your pre-test
- Kindly use the RPS cloud machine to complete the test
- While registering, you will have to give your email-id mentioned in the Assessment Excel sheet
- the assessment excel sheet can be accessed from the RPS Cloud machine desktop
- Once everyone completes the test, we will start the training
- Copy/Paste between your laptop/desktop and cloud machine is disabled as per your Bank policy
- url - rpsconsulting116.examly.io/student
</pre>

## Testing the lab environment
<pre>
- From the RPS cloud machine, you need to RDP to the Linux server assigned to you
- The Linux user will be user[xy], where xy is the last two digits of your RPS Cloud user
- We have total 3 Linux servers with the below details
  - Server 1 - 10.10.15.27 ( user01 thru user08 ) and password is rps@12345
  - Server 2 - 10.10.15.34 ( user09 thru user15 ) and password is rps@12345
  - Server 3 - 10.10.15.35 ( user16 thru user23 ) and password is rps@12345
- The Linux Server details 
  - OS - Oracle Linux v9.4 64-bit 
  - Hypervisor - KVM
  - Processor with 48 CPU Cores
  - 755 GB RAM
  - 17.3 TB HDD Storage
</pre>

Check if docker installed from the linux terminal
```
docker --version
```

Check if you are able to list docker images
```
docker images
```

Check if you are able to access the kubectl - kubernetes client tool
```
kubectl version
```

Check if you are able to access the oc - openshift client tool
```
oc version
```

check if you are able to login to Red Hat Openshift cluster from terminal
```
cat ~/openshift.txt
oc login 
```

Check if you are able to list the openshift nodes
```
oc get nodes
```

Expected output
![image](https://github.com/user-attachments/assets/3902be69-44a5-441f-99de-ade85eb55b2a)
![image](https://github.com/user-attachments/assets/0916077f-9908-46cf-bacb-6aeef7d8d45f)

## Lab - Installing Single Node Openshift cluster
```
cd ~
cd crc-linux-2.41.0-amd64
./crc setup
./crc config set memory 32768
./crc config set disk-size 50
./crc start
```

Once you the setup is completed, copy the login crendentials along with the url as shown below
![image](https://github.com/user-attachments/assets/d013c044-836c-4b8b-9678-1112bb939786)
