# Template-Terraform

## Introdução

Este template para o Terraform, que permite provisionar recursos nas plataformas Azure, AWS e GCP. O Terraform é uma ferramenta de infraestrutura como código que possibilita criar, modificar e versionar infraestruturas de forma automatizada e repetitiva. A criação de um template que suporte múltiplas plataformas como Azure, AWS e GCP é de grande importância para empresas que utilizam diferentes nuvens, tornando o processo de gerenciamento de infraestrutura mais eficiente e padronizado.

Esse tutorial tem como objetivo fornecer um passo a passo para utilizar o template de criação de recursos nas plataformas Azure, AWS e GCP através do Terraform.

## Pré-requisitos

Antes de utilizar o template para provisionar recursos nas plataformas Azure, AWS e GCP através do Terraform, é necessário ter os seguintes pré-requisitos instalados em seu ambiente:

* <b>Terraform:</b> o Terraform é uma ferramenta de infraestrutura como código utilizada para criar, alterar e provisionar recursos de infraestrutura de forma automatizada. Certifique-se de ter o Terraform instalado em sua máquina. Você pode baixá-lo em [Terraform](https://www.terraform.io/downloads.html).
* <b>Credenciais das plataformas:</b> para provisionar recursos nas plataformas Azure, AWS e GCP, é necessário ter credenciais de acesso válidas para cada plataforma. Certifique-se de ter as credenciais necessárias para se conectar à plataforma desejada.
* <b>Configuração de ambiente:</b> é necessário configurar o ambiente de acordo com as especificações de cada plataforma. Certifique-se de ter as informações necessárias, como endereços de IPs, chaves de acesso e demais configurações para criar e provisionar recursos nas plataformas Azure, AWS e GCP.

## Passos:

1. Faça o download do template disponibilizado e extraia o conteúdo na pasta desejada;
2. Acesse a pasta Environment, crie uma nova pasta com o nome do seu novo ambiente e adicione os arquivos de configuração desejados para cada provider (Azure, AWS e GCP). Para cada provider, crie um arquivo com o nome azure.tf, aws.tf ou gcp.tf, respectivamente;
3. Em cada arquivo azure.tf, aws.tf e gcp.tf, adicione os blocos de configuração dos recursos que deseja provisionar em cada plataforma. Você pode adicionar um ou mais recursos em cada arquivo, de acordo com suas necessidades.
4. Para cada recurso que deseja provisionar, edite os blocos de variáveis de acordo com as necessidades do seu ambiente. Certifique-se de que no bloco o atributo "create" esteja definido como true para que o Terraform possa provisioná-lo.
5. Caso não queira provisionar um recurso específico, basta definir o atributo "create" do bloco como false ou remover o bloco de variáveis relacionado ao recurso.
6. Após configurar todos os recursos desejados, execute o comando terraform init na pasta raiz do ambiente, para inicializar o projeto.
7. Execute o comando terraform plan para visualizar as alterações que serão feitas nos recursos antes de provisioná-los na nuvem.
8. Em seguida, execute o comando terraform apply para criar e provisionar os recursos na nuvem.


