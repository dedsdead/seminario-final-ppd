FROM node:18

# Cria os diretorios
RUN mkdir /src
WORKDIR /src

# Instala as dependencias do app
ADD package.json /src/package.json
RUN npm install

# # Gera os arquivos prisma
COPY prisma ./prisma/

# # Gera o cliente prisma
RUN npx prisma generate

# Gera a raiz do projeto
COPY . /src

EXPOSE 3333

CMD npm run dev
