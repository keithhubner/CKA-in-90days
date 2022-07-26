# Introduction - Day 1

Like any journey it's important to understand where we have come from, where we are going and how we are going to get there. In the first day of our journey to the CKA exam we are going to learn a little bit about what Kubernetes is, what it is used for and why so many companies are using it. 

Although I appreciate that this is probably not massively useful to pass the CKA exam, but it really helps put what we are doing into a wider context and a better understanding of real life use cases. 

## What is Kubernetes? 

To quote the official documentaion:

"Kubernetes is a portable, extensible, open source platform for managing containerized workloads and services, that facilitates both declarative configuration and automation."

OK that's that...moving on.... Whoa there, what the hell does that actually mean! 

### Portable 

No it doesn't mean it fits in your pocket (although technically could using a Raspberry pi!), Kubernetes is designed to be platform agnostic, meaning you can develop and run something in Kubernetes on one cloud provider or local system and easily move it to another. This prevents things like vendor lock in, but also means that you get a consistent and predictable experience no matter where you run Kubernetes. 

> Although portable, there are a number of different ways to run a Kubernetes cluster, whether this is with a cloud provider, your laptop or even a raspberry pi! Although Kubernetes is the same, the environment it runs in can be vastly different. A bit like if you moved your house to another village, your house would be the same inside with everything in the same place, but the road to get to it would be different! 

### Extensible

Kubernetes is a platform in which many technology products can, and have, extended to suit their requirements. Kubernetes allows you to extend it's functionality, for example with CRDs (we'll come onto those later). This API first modular approach makes Kubernetes extremely flexible and powerful.

### Open source

Yup it's free! (well kind of). Kubernetes was open sourced by Google in 2014, so you can take actually see and contribute to the source code! Cool right! But before you go writing graffiti all over it there is quite a rigourous process to actually have your changes accepted to main Kuberenetes release branch. If you are interesting in this you can read more about the process [here]()

### Containerized workloads

Containers are a result of the continuing abstraction of the application from the environment it runs on. Let's look back at the evolution of application deployment.

#### Traditional Hardware
One or more applications are installed on an operating system which in turn runs on some physical hardware. 

Applications ran on an operating system sitting ontop of physical hardware. This resulted in multiple applications and services fighting for resources which required additional hardware to either extend or seperate workloads. A good day for the hardware maintenors and vendors, not so much for application developers! 

As we all know, deploying and maintaining applications in this way may have kept a number of sysadmins in a job for a long time, but it has in no way helped the progression of modern applications and services! Next came virtualised deployments, hardware "carved" up to support multiple virtual servers running on the same hardware. Although this resulted in better use of hardware and application seperation, maintenance and environment drift was still all too common. 

### Declarative configuration 

### Automation

## What is it used for?

## Who uses Kubernetes?

## 
