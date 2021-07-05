# terraform-code
Using my code in terraform, My provider is AWS !


<h3> Some Tips </h3>:smiling_face_with_three_hearts:

1) Prefer to start with VPC.tf before I start with create the security group **NEXT** the VM then we can start with the LoadBalancer.
 --- 
> **Plan** - RealWorld :left_right_arrow: Described congif
 
> **Refresh** - TF view :left_right_arrow:	RealWorld

> **Apply** - Plan :left_right_arrow: RealWorld

> **Destroy** - Plan :left_right_arrow: RealWorld

 
---- 
:hand: :eyes:	
<h1>Terraform</h1>

- :teacher:Definition of Provisioners are used to execute scripts on a local or remote machine as part of resource creation or destruction. Provisioners can be used to bootstrap a resource, cleanup before destroy, run configuration management, etc.

- :mage_man:The terraform config file, It's what you want your infrastructure to look like.
    - Terraform configuration is a complete document in the Terraform language that tells Terraform how to manage a given collection of infrastructure. A configuration can consist of multiple files and directories.
---
**IaaS - Infrastructure As A Service**
- :merman:Providers : are how terraform connect out to the rest of the world.
    - Azure
    - AWS
    - GCP

- They could be on-premise infrastructure.
    - OpenStack
    - VMware

**PaaS - Platform As A Service**
- Terraform can manage higher level things platforms as a service such:
    - Heroku
    - Kubernetes
    - lambdas 

**SaaS - Software As A Service**
- Terraform also can manage pure software as a service very high level things maybe *monitoring* like : 
    - Datadog
    - Fastly
    - Github
---

- The infrastructure might composing all of these different resources.
    > So I might have some set of my infrastructure that is:
    
    - **IaaS - Infrastructure As A Service**
    - K8S
    - Namespace
    - Services
    - DNS

:star_struck:*All of these are important pieces of our infrastructure we can't deliver our application without the IaaS, PaaS and SaaS*
