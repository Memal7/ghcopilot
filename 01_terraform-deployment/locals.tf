locals {
  # create locals for tags 
  tags = {
    creator = "mustafa emal"
    purpose = "run container apps in Azure"
    env     = "dev"
  }

#  storage_account_name = "stgacc${random_integer.random.result}"
  container_registry_name = "acracc${random_integer.random.result}"
}

# create random integer for random name
resource "random_integer" "random" {
  min = 10000
  max = 99999
}