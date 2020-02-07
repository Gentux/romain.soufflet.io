# Tonka (first talk)

Yaml is data and data is dumb

How to abstract yaml => jsonnet

Libs shared online and can be included
https://github.com/sh0rez/awesome-libsonnet


# The Selfish Contributor Explained


# Kata container on Suse

Normal container not isolated enough
Kata container is container in VMs (very small one)

* Untrusted code 
* Attack surface from inside to host
* Defense in depth, if you escape container, you do not find the host
* Isolation de la mort qui tue

Using qemu / kvm


Kata container implement OCI specification like docker or runc

Kata run a vm
Storage is rootfs and volume shared via 9pfs (performance issue)
p9fs => virtio-fs

Networking is transparent from qemu

Kubernetes support for multiple runtimes. Enable to mix classic and kata container on deployments

# Docker security analysis

Capabalitises par défaut de ouf

dac_overide => permissions are crap

Configuration par défaut not suitable pour la prod.

Beaucoup de security issues dans les images.

Securisation:

* Drop all capabilities, then add
* Truster Images / Xertificate based auth
* Protect the docker daemon socket
* Apparmor support
* SeLinux
* Map root user in container to a non-root user
* Rootless deamon... not in docker

# Supervising and emulating syscalls

Syscalls : allow userspace to communicate with the kernel (a fancy request handler)
Seccomp: Allows to instercept syscalls and deniy or allow

Kernel never blocks seccomp
Seccomp runs before the syscall number is looked up in the syscall table.

works on lxc in the demo

# Below Kubernetes : Demistyfiying Container runtimes (thierry carrez)

# JD: Production-time Profiling for Python

Profilling: Getting frequency and usage of your code
* Get data on code usage through our code

2 types of profiling
* Deterministic (Register time before the call and after)
* Statiscal (The only way in production)

Statiscal profiling will wakeup times to times to register what is happening at that time.
Sampling stranghts:

* Wall & CPU Time
* Low overhead
* Granularity to the line
* Can report raised exceptions

How to get the data ? ( Wall time and CPU time )
  * Thread idles most of the time
  * wakes every 10ms
  * Calls a sys._current_frames() to get current stack traces
  * Get CPU time for each thread

In C : tracemalloc

PPROF
* Based on protobuf
* Aggregates data
* Space efficient

Visualisation tools : Also named pprof, written in go

# Adress space Isolation in the linux Kernerl

Containers run in VMs most of the time.

VMs isolation is better
But for container we have MMU

* Address space isolation is one of the vest protection methods since the invention of the virtual memory
* Vulnerabilitise are inevitable
* Make parts of the linux kernel use a restricted address space for better security

Syscall is a large attack surface. (Can we restrict it ?)
Major container isolation iare namespaces (Can we protect namespaces with page tables)

WIP : mitiagaion for hyperThreading leaks


Differente piste pour l'integration:

1 - System Call Isolation (SCI)
* Execute syscall in restricted address space
* Ability to inspect access to memory

Not a good way to deal with addresse space isolation. SCI is shit

2 - Exclusive mapping : mmap (memory mapping)

* Simple to implement
* Convenient
* But requires page flag
* Too much modification to core mm core
Fragmentation of the direct map 

3 - extenssion to memfd_create syscall

Fragmentation of the direct map 

All of that merged in kernel 5.5

Protecting maespaces with page tables
* Most object are private in namespace
* Per-namespace page tables improve isolation

Address space for netns
WIP for an API for kernel page table


Conclusion:

* Using restricted context to reduce attack surface
* Complexity vs security benefits are yet to be evaluated
* Reworking kernel address space management is a major challenge

Q&A 

Page memory are just file descriptor #mindblown

# M³, take microkernel to the next level

* Security CVEs mitigation are complex
* Microkernel is hard cause there a lot of different hardware

Mircokernel roles are Management and Enforcement. Know who can talk to who and
guarenteed only authorized stufff is happening

# Library kernel linux

Beaucoup de kernel-like projects but we don't want to rewrite everything.

# Virtio-fs : Rien compris

Mais Virtio c'est cool

# Rook.io

Kubernetes and Storage

Kubernetes need to have existing storage before going in.
If we rely on cloud provider managed service => Vendore lock-in


Rook is a storage operator
Rook automate management of deployment, Configuration and Upgrading

Rook is a framework for many storage providers and solution.
 * CNCF
 * Apache 2.0

Rook extends K8S with operators and custome type

Storage providers : 
 * Ceph
 * CockroachDB
 * EdgeFS
 * NFS
 * YugabyteDB (need to check that)

Rook in 3 layers:

* Operators (the thing that actually do the work)
* Storage Provisionning
* Data layer : Storage provider

Rook Custom Ressource Definitions (CRD)

* Feels like a normal way of dealing with k8s
* A means for user to describe their desired state

We can now use partitions in Ceph.

Roadmap:

* Stabilization
* Move rook to a different operator package
* More storage providers
* CNCF project graduation

Security audit and Process

* Independant security audit 
* Any critical vulnerabilities found must be addressed
* Security disclosuer process defined

Call to Action: Production Testimonials

# Improving protections against speculative execution side channel

Speculative execution side channel execution.

If a barista see you every day at 6:29 to order a specific drink
Another people could watch the bin and learn about you.

Side channel methods:
  Collect information about what a system does. It target all leevels of
hardware and sowftware.

All side channels needs a deep system's knowledge
It need a target implementation and taht the system is working as it's designed
for.

Timing attacks just watch the time an execution is taking to extract information
from it.


What's new in this spectre thing.

* HW/SW interface
* Innovative methods
* Target speculative execution

POC Characteristic

* Local methods
* No privilege excalation
* Read only access

How is it done ?

* ILP
* Out of order execution
* Speculative execution


Very complicated attacks.
Only gest a data sampling after an incredible ammount of luck.


Linux core scheduling
* Open development
* prevent as much as possible execution of different trusts domain on the same
  core.
* Higher contention diminushes isolation ? There's not enough place so
  scheduling can put different trust domain in the same cores
* If we enforce security here, we lose more performances

What about Quality of Service with trusts domain

We can't clean up the bin after every operations. So we need to define the right
frequency
The next patch will run VERW every time we switch from one trust domain to
another.

Speculative side channels mitigation go though cgroups. Containers are SAFER !

To enhance security

* Use well-maintained libraries
* Automate
* Only provide nescessary information
* Include update mechanism
* *Enusure data can't be guessed*
* Contant time techniques
* Independant code/data access pattern
* Use critical data as listtle as possible
* Remove data from memory


# Are you testing your obesevabilities ?

Metrics should be the first item in logging todo list

* Cheap
* Fast to implement
* Actionnable (alerting)

Add metrics to /metrics
This exposes all metric for prometheus

Pitfall #1 : Global registry
 * Introduce instances of metrics

Pitfall #2: No tests for metrics
 * simple tests to ensure that metrics are mesuring

Pitfall #3: Lack of Consistency
RED:
 * Requsts per second (Saturation)h
 * Error per second
 * Duration (tail latency)

Pitfall #4: Naming - Not conforming Naming Convention
Pitfall #4: Naming - Stability
 * If you change metric name, alerting won't work anymore

Pitfall #5: Cardinality (Unbounded labels)
Pitfall #6: Cardinality (Histogram Explosion)
Pitfall #7: Poorly Chosen Histogram Bucket

When doing metrics, be careful to not make explosion on histogram in prometheus

# A VM journey from VMware to Kubernetes

Kubernetes operate container, but also VM sometimes even legacy ones.

K8S has become industry standard with huge community.
* Highly scalable
* Declare final desired state and K8s` tries its best to make your wish true

KubeVirt is extenssion to k8s to have VM in K8S
 * Virt-Controller
 * Virt-Handler
 * Virt-Launcher
 * Contaierized libvirt

Pas ouf le talk.

How to populate.

* Create from scratch with libvirt
* Import from VMWare for legacy VMs

# VR on linux

Very brief XR crash course

XR : X Reality / Cross Reality (combination of different type of VR)


# Ideas

* Open source repository without maintener

=> Git repo + mergify auto enabled
=> Auto-merge if no review in 15 days
=> Every contributor notify to MR
=> Locked in master

* I need feedback and discuss sur mon site
* I need to finish last article

