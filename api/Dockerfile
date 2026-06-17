FROM node:18-alpine

RUN apk add --no-cache curl 

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Crear carpeta para uploads
RUN mkdir -p /app/uploads && chmod 777 /app/uploads

RUN npm run build

EXPOSE 3000
CMD ["npm", "start"]