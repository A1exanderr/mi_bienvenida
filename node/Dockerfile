FROM node:20 AS builder

WORKDIR /app
COPY src/ng-leaflet-trabajo/ /app/
RUN npm install
RUN npm run build -- --configuration=production

FROM nginx:alpine

# Copiar configuración nginx
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# Aquí copiar los archivos build estáticos que generó Angular dentro del builder
COPY --from=builder /app/dist/01front-ag/browser /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
#docker build -f node/Dockerfile -t geortal-frontend .
#docker run -d -p 80:80 geortal-frontend
