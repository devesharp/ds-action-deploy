# Imagem de contêiner que executa seu código
FROM ubuntu:18.04

# Copia o arquivo de código do repositório de ação para o caminho do sistema de arquivos `/` do contêiner
ADD entrypoint.sh package.json index.js yarn.lock /app/

RUN apt-get update && apt-get install -y \
    sudo \
    nodejs \
    npm \
    unzip \
    zip \
    sshpass \
    openssh-client

RUN npm install --global yarn
WORKDIR /app/ 
RUN chmod +x /app/entrypoint.sh

RUN yarn

# Arquivo de código a ser executado quando o contêiner do docker é iniciado (`entrypoint.sh`)
ENTRYPOINT ["/app/entrypoint.sh"]