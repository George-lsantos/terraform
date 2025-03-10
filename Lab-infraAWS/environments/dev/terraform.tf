terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # Mantemos na série 5.x para evitar breaking changes da 6.x
      version = "~> 5.0"
    }
    github = {
      source = "integrations/github"
      # Estamos fixando na versão 6.3.1 para evitar atualizações inesperadas
      version = "6.3.1"
    }
  }
}
