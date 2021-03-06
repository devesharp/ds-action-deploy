# Imagem de contêiner que executa seu código
FROM ubuntu:18.04

# Copia o arquivo de código do repositório de ação para o caminho do sistema de arquivos `/` do contêiner
ADD entrypoint.sh package.json index.js yarn.lock /app/

RUN apt-get update
RUN apt-get -y install curl dirmngr apt-transport-https lsb-release ca-certificates
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -

RUN apt-get update && apt-get install -y \
    sudo \
    nodejs \
    unzip \
    zip \
    sshpass \
    openssh-client

RUN npm install --global yarn
WORKDIR /app/ 
RUN chmod +x /app/entrypoint.sh

# Arquivo de código a ser executado quando o contêiner do docker é iniciado (`entrypoint.sh`)
ENTRYPOINT ["/app/entrypoint.sh"]