# Dados sobre o compartimento "homologação"
data "oci_identity_compartment" "homologacao" {
  id = var.compartment_id_hml
}

# Dados sobre o compartimento "produção" e a sub-rede privada
data "oci_identity_compartment" "producao" {
  id = var.compartment_id_prd
}

# Obtendo informações sobre a sub-rede privada no compartimento de produção
data "oci_core_subnet" "producao_private_subnet" {
  subnet_id    = data.oci_identity_compartment.producao.id
}

# Criar a instância no compartimento "homologação"
resource "oci_core_instance_configuration" "my_instance" {
  availability_domain = "AD-1"
  compartment_id      = data.oci_identity_compartment.homologacao.id
  shape               = var.shape
  display_name        = var.display_name

  # Configuração de instância flexível (22 CPUs e 128GB de memória)
  shape_config {
    ocpus         = 12
    memory_in_gbs = 128
  }

  # Imagem do Oracle Linux (alterar conforme a imagem disponível no seu compartimento)
  source_details {
    source_type = "image"
    image_id    = var.image
  }

  # Configuração de rede (sub-rede privada no compartimento "produção")
  create_vnic_details {
    subnet_id        = data.oci_core_subnet.producao_private_subnet.id
    assign_public_ip = false # Sub-rede privada, sem IP público
  }

  # Adicionar um disco adicional de 1TB
  attached_disks {
    disk_size_in_gbs = 1024 # 1TB de disco
    is_read_only     = false
  }

  # Chave SSH para acesso
  metadata = {
    ssh_authorized_keys = file("~/.ssh/id_rsa.pub")
  }
}