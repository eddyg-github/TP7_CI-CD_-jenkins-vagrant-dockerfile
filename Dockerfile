# Utiliza la imagen base NGINX más reciente
FROM nginx:latest

# Copia el archivo de configuración personalizado en la ubicación deseada dentro del contenedor
COPY nginx-config-file.conf /etc/nginx/conf.d/default.conf

# Expon el puerto en el que la aplicación estará escuchando
EXPOSE 80

# Copia el archivo de prueba dentro del contenedor
COPY test-script.sh /usr/share/nginx/html/test-script.sh

# Define un comando de inicio para ejecutar la aplicación y mantener el contenedor en funcionamiento
CMD ["nginx", "-g", "daemon off;"]