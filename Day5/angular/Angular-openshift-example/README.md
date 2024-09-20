# Steps to Deploy an Angular on Red Hat OpenShift

![OpenShift - Wikipedia](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/OpenShift-LogoType.svg/100px-OpenShift-LogoType.svg.png)![Angular - PRESS KIT](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLHZ7_lKApQX-3zDkXMVG029QBcaAc4F8sq9z7O7P5mw&s)

The [Developer Sandbox for Red Hat OpenShift](https://developers.redhat.com/developer-sandbox) is a free-to-use OpenShift instance for you to experiment with OpenShift for your use cases.The development of dynamic and responsive web applications has evolved into a fundamental requirement. Node.js and Angular stand out as formidable technologies capable of crafting these applications with finesse. Our workflow involves the creation and deployment of applications directly from GitHub onto an OpenShift sandbox environment.
Follow these steps to start your sandbox instance and deploy your Angular app:
1.  Create a Red Hat Sandbox account using [https://developers.redhat.com/developer-sandbox](https://developers.redhat.com/developer-sandbox)
   
2.  Once you have the account and are signed in, On the left side menu, click on +**Add**.
    
3.  Select **Import from Git**.
    
4.  Specify your Git repo URL. For the sake of this tutorial, we use[https://github.com/redhat-developer-demos/Angular-openshift-example.git](https://github.com/redhat-developer-demos/Angular-openshift-example.git). But, you can choose any AngularJS repo.
    
5.  Add a Containerfile to your repo. The Containerfile helps developers to specify the environment needed for running your applications. In case, you do not have a Containerfile on your project, you can add add one to your repo by referring to [https://github.com/redhat-developer-demos/Angular-openshift-example/blob/main/Containerfile](https://github.com/redhat-developer-demos/Angular-openshift-example/blob/main/Containerfile)
    
6.  OpenShift will detect the Containerfile from the git repository. In case the Containerfile is in a subdirectory, you need to provide the path of Containerfile. 
[ **NOTE**: If the containerfile/Dockerfile is not detected, click Import Edit Strategy. Select as Dockerfile, define the path as Containerfile. ]

7.  Choose a Resource Type field, please choose either Deployment or Serverless Deployment (default option) depending on your preference.
    
8.  Select **Target Port** under Advanced options to define the port 8080 that will receive the container's traffic.
   
9.  Click on Create.
    
10.  You will now be directed to the Topology view, and the application will commence deployment. Please allow some time for the build & deployment process to complete. While it is in progress, you will have the opportunity to monitor the logs.
    
11.  Once it’s done deploying, you can click on the **↗** OpenURL icon to see the webpage of your Angular application running on OpenShift.

In this tutorial, you learned how to deploy an Angular application on Red Hat OpenShift. Red Hat OpenShift has powerful features that make it easy to manage and scale your Angular application in production.
