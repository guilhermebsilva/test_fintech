# Terraform AWS Project

Este projeto cria uma infraestrutura básica na AWS utilizando **Terraform**. Ele inclui:

1. Uma instância **EC2** configurada com **Nginx** rodando em um container Docker.
2. Uma **VPC** com subnets públicas e privadas, NAT Gateway e regras de segurança.
3. Uma distribuição **CloudFront** para expor o serviço da instância EC2 via HTTPS.

---

## Pré-requisitos

Antes de começar, certifique-se de ter:

- **Conta AWS** com permissões adequadas (ex.: `AdministratorAccess`).
- **AWS CLI** configurada na máquina local.
- **Terraform** instalado e configurado.

---

## Recursos Criados

### 1. VPC
- Uma VPC com subnets:
  - **Pública**: Hospeda a instância EC2 e o NAT Gateway.
  - **Privada**: Disponível para recursos internos.
- **Internet Gateway**: Permite acesso externo à subnet pública.
- **NAT Gateway**: Permite acesso à internet para a subnet privada.

### 2. EC2
- Uma instância **Amazon Linux 2**:
  - Configurada para rodar o **Nginx** em um container Docker.
  - Associada a um **Security Group** que permite tráfego HTTP (porta 80) e SSH (porta 22).

### 3. CloudFront
- Uma distribuição **Amazon CloudFront**:
  - Configurada para redirecionar tráfego HTTPS para a instância EC2.
  - Utiliza o certificado SSL padrão do CloudFront.

---

## Configuração

1. **Clone o repositório:**
   ```bash
   git clone <URL_DO_REPOSITORIO>
   cd terraform-aws-project

2. **Inicialize o Terraform:**
     terraform init

3. **Verifique o plano de execução:**
     terraform plan

4. **Aplique as configurações:**
     terraform apply

5. **Confirme a aplicação:**
     Digite yes quando solicitado.

## Testando a Aplicação

Acesso Direto via EC2 (HTTP)

	1.	Copie o Public DNS ou Public IP da instância EC2.
	2.	Acesse no navegador:
    http://<EC2_PUBLIC_DNS>

Acesso via CloudFront (HTTPS)

	1.	Copie o Domain Name da distribuição CloudFront (ex.: dxxxxxxxxxxx.cloudfront.net).
	2.	Acesse no navegador:
    https://<CLOUDFRONT_DOMAIN>

## Limpeza

Para evitar custos desnecessários, destrua os recursos criados:

    terraform destroy


## Estrutura do Projeto

terraform-aws-project/
├── main.tf           # Configuração principal
├── variables.tf      # Variáveis globais
├── outputs.tf        # Saídas
├── modules/
│   ├── ec2/          # Módulo EC2
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── vpc/          # Módulo VPC
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── cloudfront/   # Módulo CloudFront
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf


## Autor

Guilherme Silva | DevOps Engineer



