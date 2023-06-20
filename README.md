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

#### locals
- introduce local variables and use inside code

#### output
- Can get output like ip address from this

#### 


# followed tutorials 
- https://www.youtube.com/watch?v=V4waklkBC38
- https://www.terraform-best-practices.com/

