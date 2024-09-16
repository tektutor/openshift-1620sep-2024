# Day 1

## Hypervisor Overview
<pre>
- is virtualization
- virtualization allows us to run many Operating System side by side on the same machine ( laptop/desktop/workstation/server )
- many OS can be running at the same time
- each VM requires
  - dedicated hardware resources
  - requires dedicated CPU Cores, RAM and disk 
- hence this kind of virtualization is considered as heavy-weight
- each Virtual Machine - represents one fully function operating system
- each Guest OS running within Virtual Machines has its own dedicated OS Kernel
- there are 2 types
  - Type 1 - Bare Metal Hypervisor ( Used in Workstations and Servers )
    - Virtual Machines can be created without installing Host OS
    - Examples
      - VMWare vSphere/Vcenter
  - Type 2 - ( Used in laptops/desktops/Workstations )
    - it can be installed on top of Host OS ( Windows/Linux/Mac )
    Examples
    - VMWare Fusion ( Earlier Paid software that works on Mac OS-X, it is made free by VMWare )
    - VMWare Workstation Pro ( Earlier Paid softwars that works in Linux and Windows, now it is completely free )
    - Oracle VirtualBox - Free ( works in Mac, Linux and Windows )
    - Microsoft Hyper-V
    - Parallels ( commercial product - works in Mac OS-X )
    - KVM - opensource Hypervisor that works in all Linux Distributions
</pre>

## Benefits of using Hypevisors
<pre>
- Server consolidation
- How many minimal physical servers are required to support 1000 Virtual Machines?
  - 1 Physical Server is enough
- Server Motherboards generally comes with Multiple Processor Sockets
- Processors are packaged in two ways
  Single Chip Module (SCM - Each Integrated Circuit will have 1 Processor )
  Multiple Chip Module (MCM - Each IC will have multiple Processors )
- Let's assume
  - the server supports 4 Processor Sockets
  - let's install each Socket with MCM based Processors i.e 1 Socket with 4 Processors
  - each Processor supports 128 CPU Cores
  - total CPU Cores 16 x 128 = 2048 Physical CPU Cores
  - total logic cores 16 x 128 x 2 = 4096 logical CPU Cores
  - Hyperthreading - each physical cpu core is capable of running 2 threads in parallel
  - each Physical CPU Core is seen as 2/4/8 logical cpu cores by Hypervisor software
  - let's assume each Physical CPU core supports 2 threads parallely
</pre>

## Hypervisor - High Level Architecture

## Linux Kernel - Container support
<pre>
- Namespace - helps in isolating one container from other containers
- Control Groups(CGroups ) - helps in applying resource quota restrictions at container level
  - Ex 
    - we can control the max RAM utilized by a container
    - we can apply a max limit on how many CPU cores a container can utilize at any point of time
    - can help in restrication how much disk/storage a container can use at the max
</pre>  

## Container Overview
<pre>
- light-weight virtualization technology
- is an application virtualization technology
- all containers running on a Host OS shares the hardware resources available to the Host OS
- each container represents one application( application process )
- containers don't represents Operating System
- container don't have their own OS Kernel as they are just application not a OS
- container will never be able to replace OS/Virtualization
</pre>

## Container Runtime Overview
<pre>
- container runtimes internally depends on the Linux Kernel features - Namespace and CGroups
- helps managing containers and images
- low-level softwares, not so user-friendly
- hence, normally end-users don't use these softwares directly
- Examples
  - runC - Container Runtime
  - CRI-O - Container Runtime
</pre>

## Container Engine Overview
<pre>
- container engines helps us manage containers and images
- high-level software, very user-friendly
- internally depends on Container Runtimes to manage images and containers
- Examples
  - Docker is a Container Engine
    - internally depends on containerd
    - containerd depends on runC Container Runtime
  - Podman is a Container Engine
    - internally depends on CRI-O Container Runtime
</pre>

## Docker Overview
<pre>
- Docker Inc organization developed Docker using Go lang
- Docker Engine comes in 2 flavours
  1. Docker Community Edition - Docker CE ( Free )
  2. Docker Enterprise Edition - Docker EE ( Paid )
</pre>

## Docker High-Level Architecture
![Docker](DockerHighLevelArchitecture.png)

## Why Red Hat Openshift supports only Podman and not Docker
<pre>
- Upto Red Hat Openshift v3.11, docker was the default container engine supported by Kubernetes and Openshift
- Docker had a security flaw, which gives administrative access to non-administrators
</pre>

## Container Orchestration Overview

## Docker SWARM Overview

## Kubernetes Overview

## Red Hat Openshift Overview
