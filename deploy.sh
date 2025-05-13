#!/bin/bash

# Vai nel container di Docusaurus
docker exec -u root docusaurus bash -c "
  # Vai alla cartella del progetto
  cd /usr/src/app

  # Esegui il pull delle ultime modifiche
  git pull origin master

  # Installa le dipendenze (se necessario)
  npm install

  # Esegui il build del sito
  npm run build
"

# Riavvia il container per caricare i nuovi file
docker restart docusaurus
