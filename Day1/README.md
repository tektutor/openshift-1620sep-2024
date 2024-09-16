# Day 1

## Hypervisor Overview
<pre>
- is virtualization
- virtualization allows us to run many Operating System side by side on the same machine ( laptop/desktop/workstation/server )
- many OS can be running at the same time
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

## Container Runtime Overview

## Container Engine Overview

## Docker Overview

## Docker High-Level Architecture

## Container Orchestration Overview

## Docker SWARM Overview

## Kubernetes Overview

## Red Hat Openshift Overview
