# Usa la imagen oficial de nginx como base
FROM nginx:alpine

# Copia archivos personalizados al directorio que Nginx sirve
COPY ./html /usr/share/nginx/html

# Expone el puerto 80 (por defecto en nginx)
EXPOSE 80

# Usa el comando por defecto de nginx
CMD ["nginx", "-g", "daemon off;"]
