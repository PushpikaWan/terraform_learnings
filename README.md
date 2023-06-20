# Terraform_learnings
This is a test project to learn and try out terraform scripts

## Notes

### project initial steps
1.Usually add entry point with 'main.tf' file
2.Add terraform provider - https://registry.terraform.io/browse/providers
3.Then config aws cli and get ami for the project
4.Run terraform init
5.Run additional command to 
  - format -> terraform fmt
  - validate -> terraform validate
6.Run
  - terraform init
  - terraform plan
  - terraform apply
7.When we run these command it terraform scripts will be generated automatically.
  - can see status update in ->terraform.tfstate (there is a backup file as well)
  - can see locked versions in -> terraform.lock.hcl

#### variables
- Can introduce variable in code
- There are several ways to provide values
  1. Provide value through command
    ex: terraform plan -var=<variable-name>=<variable-value>
  2. Provide value through tf files 
    ex: terrafor.tfvars
- can Add validations, data type, sensitivity, description
- theses .tfvars files loaded to root by default (.dev.tfvars, .prod.tfvars)
- can use env. variables with remote
- ENV variable must be start with TF_VAR_ <name>...
- Can override variables... various ways (there is a file precedence)

#### locals
- introduce local variables and use inside code

#### output
- Can get output like ip address from this
- Can have descriptions, sensitivity
- Can provide output type -> raw, json...

#### Data source
- use information defined outside of the terraform

#### Resource meta arguments
- control resources
- depends_on, count....
- lifecycle_blocks -
  - create_before_destroy
  - prevent_destroy
  - ignore_changes
- resource providers and alias
  - can use to override 


#### Providers
- can add aws providers and customise

#### destroy
- terraform apply --destroy to destroy all of our resources

#### workspace
- To see all workspaces - terraform workspace list 
- We need to migrate local to remote to share all tf changes
- Steps
  - Create a workspace in terraform web
  - add configuration to point that workspace
  - Run below commands
    - terraform login
    - terraform init
- This will take my state file and move it into the remote workspace
- Then we can remove state file in our local project. But keep backup
- We need to set locally added variables in workspace (variables.tfvars)

#### Provisioners 
- types
  - local-exec
  - remote-exec
  - file
  ** strongly recommended to use backed golder image to work with complex task.(can use packer)
- connection
- null_resources
- doing ssh server by configuring

#### Providers
- providers are plugins and plugins must be downloaded before use. 
It will be downloaded with the terraform init
- show all providers -> terraform providers
- can create modules with providers to provide set of configs

#### Registries
- publish providers, modules (group of configuration files) here
- There are public and private registries

##### Terraform Language
- .tf , .tf.json
- HCL
- support json alternative syntax as well

#### Terraform settings
- config blocks

#### 

# followed tutorials 
- https://www.youtube.com/watch?v=V4waklkBC38
- https://www.terraform-best-practices.com/

# special notes
* Do not use terraform for provisioning tool. Use other alternatives for that. 
Use configuration management tool for that (ex: Ansible, chef, puppet)
* Fine line between Terraform and ConfigManagement tools(Ansible,....)
  - Use terraform to do providers, modules, and non repeatable provisioning actions
  - Use config management tool to do provisioning with repeatable actions
* 
