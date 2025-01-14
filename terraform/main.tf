module "control_plane" {
  source        = "./modules/control_plane"
  vm_name       = "cp-01-brazil"
  region        = "Brazil South"
  rg_name       = "cp-01-brazil-rg"
  size          = "Standard_D4s_v3"
  ssh_key       = file("~/.ssh/id_rsa.pub")
}

module "node1" {
  source        = "./modules/node"
  vm_name       = "wk-02-us"
  region        = "East US"
  rg_name       = "wk-02-us-rg"
  ssh_key       = file("~/.ssh/id_rsa.pub")
}

module "node2" {
  source        = "./modules/node"
  vm_name       = "wk-03-west"
  region        = "West US"
  rg_name       = "wk-03-west-rg"
  ssh_key       = file("~/.ssh/id_rsa.pub")
}
