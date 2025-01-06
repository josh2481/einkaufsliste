# Node.js-Image verwenden
FROM node:18

# Arbeitsverzeichnis festlegen
WORKDIR /app

# Abhängigkeiten kopieren und installieren
COPY package.json package-lock.json ./
RUN npm install

# Backend und Frontend-Dateien kopieren
COPY . .

# Port freigeben
EXPOSE 3000

# Server starten
CMD ["node", "server.js"]