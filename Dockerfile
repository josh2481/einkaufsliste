# Verwenden des offiziellen Node.js-Images
FROM node:16

# Arbeitsverzeichnis erstellen und festlegen
WORKDIR /app

# Kopieren der package.json und package-lock.json (wenn vorhanden)
COPY package*.json ./

# Installiere die Abhängigkeiten, die im package.json definiert sind
RUN npm install --legacy-peer-deps

# Kopiere den Rest des Projekts in das Container-Verzeichnis
COPY . .

# Stelle sicher, dass die richtigen Berechtigungen gesetzt sind
RUN chown -R node:node /app

# Standard-Port des Webservers
EXPOSE 3000

# Verwende den nicht-root user node zum Ausführen des Containers
USER node

# Befehl, um die Anwendung zu starten
CMD ["npm", "start"]