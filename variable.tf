variable "ProjectName" {
  description = "Nome do Projeto"
  default     = "DevOpsProject"
}

variable "Owner" {
    description = "Responsável pelo produto"
    default     = "GloboEsporte"
}


variable "SubnetFE" {
    
    description = "Rede de FE"
    default     = ["10.0.5.0/24","10.0.6.0/24"]
}

variable "SubnetBE" {
  
    description = "Rede de BE"
    default     = ["10.0.3.0/24","10.0.4.0/24"]
}


variable "availability_zones" {
    
    description = "Zona de Disponibilidade"
    default     = ["us-east-2a","us-east-2b","us-east-2c"]
}