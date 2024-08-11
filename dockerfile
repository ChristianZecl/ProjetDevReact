# Étape 1 : Utiliser une image Node officielle pour la construction
FROM node:18 AS build

# Définir le répertoire de travail à l'intérieur du conteneur
WORKDIR /app

# Copier le fichier package.json et package-lock.json pour installer les dépendances
COPY package.json package-lock.json ./

# Installer les dépendances du projet
RUN npm install

# Copier tout le code source du projet dans le conteneur
COPY . .

# Construire l'application pour la production
RUN npm run build

# Étape 2 : Utiliser une image Nginx officielle pour servir l'application
FROM nginx:alpine

# Copier les fichiers construits depuis l'étape précédente dans le dossier Nginx
COPY --from=build /app/build /usr/share/nginx/html

# Exposer le port 80 pour le serveur
EXPOSE 80

# Démarrer Nginx
CMD ["nginx", "-g", "daemon off;"]