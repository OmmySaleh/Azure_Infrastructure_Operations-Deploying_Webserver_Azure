# README.md
Azure Infrastructure Operations Project: Deploying a scalable IaaS web server in Azure

### Introduction
For this project, I will write a Packer template and a Terraform template to deploy a customizable, scalable web server in Azure.

### Getting Started
1. Clone this repository

2. Create my infrastructure as code

### Dependencies
1. Create an [Azure Account](https://portal.azure.com) 
2. Install the [Azure command line interface](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
3. Install [Packer](https://www.packer.io/downloads)
4. Install [Terraform](https://www.terraform.io/downloads.html)

### Instructions

1. Creating and Applying a Tagging Policy. 
- Prior to the start, we want to create a policy that ensures all indexed resources are tagged. This will help us with organization and tracking, and make it easier to log when things go wrong. 
- We start by emposing a policy definition with Deny effect, that denies the creation of resources that do not have tags and this will be defined by the policy rule which describes what we have as the condition and then the effect of that condition.
- After writting our policy definition we then create an assignment for our policy and apply the policy definition to our subscription with the name "tagging-policy".
- In order to verify that our policy has been correclty deployed and applied we run "az policy assignment list" on our CLI.

2. Creating a Server Image
- Firstly, we will have to use Packer to create a server image. Packer is an open source tool for creating identical machine images for multiple platforms from a single source configuration. Here we have to ensure that the provided application is included in the template.
- Then we create a resource group but for this particular project the resource group was already been created for us by Udacity Cloud Lab as "Azuredevops".
- We then need to get ![PolicyList](https://user-images.githubusercontent.com/110615576/182965454-4e1617ad-a875-4486-9bf0-7df7b9dcbad5.png)![PlanSaved](https://user-images.githubusercontent.com/110615576/182965699-40c0fa82-938c-45f7-89d0-6575f92aac1b.png)
![Resources](https://user-images.githubusercontent.com/110615576/182965829-5ab92f4d-e34f-4bed-90fc-0e692354c1b7.png)
![MyPackerImage](https://user-images.githubusercontent.com/110615576/182966069-a251ee68-d677-4b99-ba70-a1906dd908e8.png)
![PackerBuild](https://user-images.githubusercontent.com/110615576/182966135-88e32fb9-13f7-42be-8cae-bb4c72983375.png)
![TaggingPolicy](https://user-images.githubusercontent.com/110615576/182966229-61594aa3-ee16-4504-aa3f-209a5f4d7fad.png)
, which we can get them from the Environment Details of our Udacity Cloud Lab and then we run the sever json template which will use Packer to build and create the server image. We will use an Ubuntu 18.04-LTS SKU as our base image, we will ensure the requirements in our provisioners and also making sure that the resource group specified in packer for the image is the same image specified in Terraform.
- Then we run the following command to build our image; "To build the image we use "packer build server.json".

3. Creating the Infrastructure.
- Our Terraform template will allow us to reliably create, update, and destroy our infrastructure. Here, before we get started, we'll need to verify that the tagging-policy we deployed earlier is still available and we will do this using the Azure CLI.
- Then we will start by create if not yet done and locate the existing resource group then we locate the existing packer image.
- We then create a Virtual network and a subnet on that Virtual netwwork, then we create a Network Security Group that will allow access to other VMs on the subnet and deny direct access from the internet, then we create a Network Interface followed by a Public IP and a Load Balancer then we create a virtual machine availability set along with virtual machines we also create managed disks for our virtual machines
- We have to ensure that variables file allows for customers to configure the number of virtual machines and the deployment at a minimum.

4. Deploying our Infrastructure
- After we have correctly written our Packer and Terraform templates we can then deploy our work.
- We will run the packer build command on our Packer template this will create our packer image.
- We will then run the terraform plan -out <filename> in our project the file name is solution.plan this will enable us to view the resources that will be created and save the plan file to disc.  
- Lastly we deploy our Terraform infrastructure and once we are done with the deployment we destroy it using the terraform destroy command.
 
 
### Output

1. Tagging Policy.
- After correct execution of the given instructions above concerning Creating and Applying a Tagging Policy the "tagging-policy" was successfully deployed and applied and that can be verified from the screenshot of the results of the "az policy assignment list" command attached in this Github repository.

2. Server Image.
- Upon correct deployment of the given instrunctions above regarding Creating a Server Image, the command "To build the image we use "packer build server.json" was executed and the image was succefully built.

3. The Infrastructure with the Terraform Template.
- By using our Terraform template and correct deployment of the given instructions above we were able to create the infrastructure for the application to run on.

4. Deploying our Infrastructure.
Finally, after we have correctly written our Packer and Terraform templates and by using a service principal we were able to deploy our Virtual Machine image using Packer and thereafter we used Terraform to succefully deploy our infrastructure. 



