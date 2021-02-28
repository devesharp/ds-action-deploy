# Imagem de contêiner que executa seu código
FROM ubuntu:18.04

# Copia o arquivo de código do repositório de ação para o caminho do sistema de arquivos `/` do contêiner
COPY entrypoint.sh /entrypoint.sh

RUN apt-get update && apt-get install -y \
    sudo \
    unzip \
    zip \
    sshpass \
    openssh-client

RUN chmod +x entrypoint.sh

# Arquivo de código a ser executado quando o contêiner do docker é iniciado (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]