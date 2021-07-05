# terraform-code
:cloud:	:cloud: :hearts: :cloud:	:cloud:

Using my code in terraform, My provider is AWS !


<h3> Some Tips </h3>:smiling_face_with_three_hearts:

1) Prefer to start with VPC.tf before I start with create the security group **NEXT** the VM then we can start with the LoadBalancer.
 --- 
> **Plan** - RealWorld :left_right_arrow: Described congif
 
> **Refresh** - TF view :left_right_arrow:	RealWorld

> **Apply** - Plan :left_right_arrow: RealWorld

> **Destroy** - Plan :left_right_arrow: RealWorld

 
---- 
:hand: :eyes: :cloud:	
<h1>Terraform</h1>

- :teacher:Definition of Provisioners are used to execute scripts on a local or remote machine as part of resource creation or destruction. Provisioners can be used to bootstrap a resource, cleanup before destroy, run configuration management, etc.

- :mage_man:The terraform config file, It's what you want your infrastructure to look like.
    - Terraform configuration is a complete document in the Terraform language that tells Terraform how to manage a given collection of infrastructure. A configuration can consist of multiple files and directories.
---
**IaaS - Infrastructure As A Service**:pushpin:
- :diamonds:Providers : are how terraform connect out to the rest of the world.
    - Azure
    - AWS
    - GCP

- :diamonds:They could be on-premise infrastructure.
    - OpenStack
    - VMware

**PaaS - Platform As A Service**:pushpin:
- :diamonds:Terraform can manage higher level things platforms as a service such:
    - Heroku
    - Kubernetes
    - lambdas 

**SaaS - Software As A Service**:pushpin:
- :diamonds:Terraform also can manage pure software as a service very high level things maybe *monitoring* like : 
    - Datadog
    - Fastly
    - Github
---

- :cloud_with_lightning_and_rain:The infrastructure might composing all of these different resources.
    > So I might have some set of my infrastructure that is:
    
    - **IaaS - Infrastructure As A Service**
    - K8S
    - Namespace
    - Services
    - DNS

:star_struck:*All of these are important pieces of our infrastructure we can't deliver our application without the IaaS, PaaS and SaaS*

**They're all part of our logical end-to-end delivery and what we want to get with terraform is a Signal unified workflow**

*We don't want it to be you use one tool to manage this and you have ti figure out how you get past this disjoint to manage the next section and then another disjoint experience and you have to piece together these things.*

:sparkles:	:reminder_ribbon:	:dart:

---
---
<h3>:interrobang:Best Question:</h3> 

> How manage terraform :question:

:ballot_box_with_check:**We Start**

:ballot_box_with_check:*A signal individual practitioner -> Who is using terraform locally and there workflow is to start by writing some terraform configuration, THEN they run **terraform plan**, plan tells them what is this configuration going to do ... what does terraform thinks needs to be done to apply these changes and if this looks good the practitioner will apply changes and this cycle continues to evolve the infrastructure*

:ballot_box_with_check:*Now, we add multiple team members we have other people we want to collaborate on managing the same infrastructure*

:ballot_box_with_check:**Well there's a few challanges much like with software writing**

> How do we make sure we have a consistent view of what the configuration actually is and how do we make sure we don't step on each other's ... and run multiple changes in parallel :question:

:ballot_box_with_check:**So this problem in some sense ends up being very similar to the problem of using git locally versus using git as a team ... So as we go to a team we use a system like github to provide that central collaboration and so our equivalent of that is what we terraform enterprise**
--
:ballot_box_with_check:**The terraform enterpris** : *workflow arugments*

:ballot_box_with_check:*The state file is an important things to have centrally managed so it doesn't diverge or end up with sort of different lineages where you you know we fork off and then independently run terraform and now the state file conflict with one and another, So by managing that centrally we avoid those sort of conflicts* :trident:	

----
:yellow_circle:	:red_circle:	:large_blue_circle:	:brown_circle:	:green_circle:	
----