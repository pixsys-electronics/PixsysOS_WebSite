# Usa Node.js come immagine di base
FROM node:18

# Imposta la cartella di lavoro
WORKDIR /usr/src/app

# Copia il progetto nella cartella di lavoro
COPY . .

# Installa le dipendenze necessarie, inclusi iproute2
RUN apt-get update && apt-get install -y iproute2

# Installa le dipendenze
RUN npm install

# Costruisci il sito
RUN npm run build

# Espone la porta 3000
EXPOSE 3000

# Avvia Docusaurus
CMD ["npm", "run", "start", "--", "--host", "0.0.0.0"]
