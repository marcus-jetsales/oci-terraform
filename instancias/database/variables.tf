# variables.tf
variable "tenancy_ocid" {}

variable "user_ocid" {}

variable "fingerprint" {}

variable "private_key_path" {}

variable "region" {}

variable "compartment_id" {}

variable "image_id" {
  description = "Inform o ocid da imagem"
  type        = string
  default     = ""
}

variable "compartment_id_hml" {
  description = "id do compartiment de homologação"
  type        = string
  default     = "ocid1.compartment.oc1..aaaaaaaa7osmijyqnxrgz35nntjredeu7f4xrfa2oazglvrlg6b2txzpupwq"
}

variable "compartment_id_prd" {
  description = "id do compartiment de produção"
  type        = string
  default     = "ocid1.tenancy.oc1..aaaaaaaa6hga6ofpuvw4piuzvxbuj35svlv3maffec2oiagw5rarxul4zpza"
}

variable "shape" {
  description = "shape que vai ser implantado na instancia"
  type        = string
  default     = "VM.Standard.E4.Flex"
}

variable "display_name" {
  description = "nome que será exibido"
  type        = string
  default     = "postgresql-testes"
}

variable "image" {
  description = "ocid da imagem desejada"
  type        = string
  default     = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaaqev6un6axeikiehhz7mw5csgjykhvoln5ntbki6xy32p72nh53pq"
}