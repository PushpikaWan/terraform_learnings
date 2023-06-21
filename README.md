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

#### Expressions
- Types and values
  - string, bool, number, null (no type)
  - list , maps
  - String interpolation, directives,  multiline (unix)
  - use ~ to trim tails
- Operators
  - math operators
  - conditional ops
  - splat operator - * -> to show all
- semantic versioning / progressive versioning
  - use ~> 1.1.0 to patch increment and check other possibilities...

#### Terraform State
- Terraform creates a terraform.tfstate file when starting provisioning
- Contains one to one mapping from resource instances to remote objects
- Have commands -> terraform state show, pull, push , list,.......
- terraform state mv -> rename resources, move into a module
- These state changes avoid apply, create and destroy actions

#### Resource drift
- Resources are in different state than expected
- Solutions
  - replacing  -> terraform app;y -replace to mark resources for replacement
  - import
  - refresh

#### Resource addressing
- identifies resources

#### debugging
- log file can be enabled by TF_LOG environment 

##### modules
- folder structure ->

#### backends
- standard backends - only manage state
- Enhanced backends - can store state and can perform operations
- can provide backend config file dynamically for changing variables

#### Terraform remote state
- only expose output values

#### State locking
- lock state for all operations
- can disable lock and force unlocak as well

#### protect sensitive date
- can keep in local file without commiting
- In remote, use env var or var from site
- In s3 make sure to on encryption and versioning

#### .terraformignore

#### Resources
- can provide timeout for creation and deletions
- two complex types
  - collection types -> list, map, set
  - structural types -> object, tuple

#### Built-in-function
- numeric functions -> abs, max...
- string functions -> format, chamop....
- collection functions -> allTrue, anyTrue, concat, distinct,....
- Encoding and decoding functions -> 
- File system functions
- Date and time functions
- Hash and crypto functions
- IP Network functions
- Type conversion functions

#### Terraform cloud
- Terms -> Organizations > Workspaces > Teams (can be in multiple workspaces)
- work flows -
  - version-control workflows
  - CLI - driven workflows
  - API - driven workflows
- Permissions -> workspace level, organization level....
- API token -> user, organization, workspace level
- Cost estimation -
- Terraform cloud agents -> VSphare, nutanix, OpenStack


##### Terraform Enterprise
- self hosted distribution of terraform platform

#### Air gapped environments
#### Workspaces
- allows to manage multiple env
- two types
  - cli workspaces
  - cloud workspaces
- can get workspace name -> ${terraform.workspace}
- commands
  - terraform workspace list
  - terraform workspace show
  - terraform workspace select
  - terraform workspace new
  - terraform workspace delete

#### Sentinel
- Embedded policy as code framework
- Can write restriction such as required private and encrypted s3 bucket and many rules....
- sentinel policies stay between plan and apply actions
- There are plugins to use template for rules

#### Packer
- is a developer tool to provision a build image
- immutable
- Can use post provisioners with this (like ansible, puppet, chef...)
- file should be name -> <name>.pkr.hcl
- install packer first
- command
  - packer build ....filename...


#### Consul
- is a service networking platform

#### vault
- is a tool for securely access secret from multiple stores
- inject -> generate short live credentials from that machine users


#### CDK for Terraform
- AWS cloud development kit for terraform
- Can code using preferred languages

#### Gruntwork
- software company provides tools to work with terraform
  - terragrunt - Keep configuration DRY
  - terratest - 
.....



#### Commands
- terraform init
  - create lock file
  - download plugins and deps
- terraform get
  - download and update modules
- terraform fmt
- terraform validate
- terraform console
- terraform plan
- terraform apply -> automatic plan mode, saved plan mode **

# followed tutorials 
- https://www.youtube.com/watch?v=V4waklkBC38
- https://www.terraform-best-practices.com/

# special notes
* Do not use terraform for provisioning tool. Use other alternatives for that. 
Use configuration management tool for that (ex: Ansible, chef, puppet)
* Fine line between Terraform and ConfigManagement tools(Ansible,....)
  - Use terraform to do providers, modules, and non repeatable provisioning actions
  - Use config management tool to do provisioning with repeatable actions
* Check terraform apply saved plan mode with file
* terraform init -backend-config= <filename>.hcl
* Use Terragrunt to avoid boiler plates
* Terratest for testing


