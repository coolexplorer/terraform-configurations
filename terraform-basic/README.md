# Terraform Basic

## Terraform workflow
1. Init
    - Used to initialze a working directory containing terraform config file
    - This is the first command that should be run after writing a new Terraform configuration
    - Downloads Providers

2. validate
    - Validates the terraform configurations files in that respective directory to ensure they are syntactically valid and internally consistent. 

3. plan
    - Creates an execution plan 
    - Terraform performs a refresh and determines what actions are necessary to achieve the desired state specified in configuration files

4. apply
    - Used to apply the changes required to reach the desired state of the configurations.
    - By default, apply scans the current directory for the configuration and applies the changes appropriately.

5. destory
    - Used to destroy the Terraform-managed infrastructure.
    - This will ask for confirmation before destorying.


## Terraform Language Basic

### Configuration Syntax

```shell
# Template
<BLOCK Type> "<BLOCK LABEL>" "<BLOCK LABEL>" {
    # Block body
    <IDENTIFIER> = <EXPRESSION> # Argument
}

# Example - Azure Resource Group
resource "azurerm_resource_group" "demo_rg1" {
  location = "westus2"  # Argument 1
  name = "demo_rg1"     # Argument 2
}
```

1. Block type
    - Top level block : resource, provider
    - Block inside block : provisioners, resource specific blocks like tags

2. Block label
    - Based on Block typ, block labels wiil be 1 or 2. 
    - ex) resource - 2 labels, variables - 1 label

3. Arguments
    - Left side value : Identifier or Name
    - Right side value : Expression or Value

4. Attribute
    In Terraform's configuration language: a named piece of data that belongs to some kind of object. The value of an attribute can be referenced in expressions using a dot-separated notation, like aws_instance.example.id.

5. Meta-Arguemnt
    The Terraform language defines several meta-arguments, which can be used with any resource type to change the behavior of resources.

    The following meta-arguments are documented on separate pages:

    `depends_on`, for specifying hidden dependencies
    `count`, for creating multiple resource instances according to a count
    `for_each`, to create multiple instances according to a map, or set of strings
    `provider`, for selecting a non-default provider configuration
    `lifecycle`, for lifecycle customizations
    `provisioner`, for taking extra actions after resource creation

6. Top level blocks
    - Fundamental blocks
        . Terraform block
        . Providers block
        . Resources block
    - Variable blocks
        . Input variable block
        . Output values block
        . Local values block
    - Calling / Referencing Blocks
        . Data Source block
        . Modules block
