#!/bin/bash

# Realiza una solicitud HTTP al servidor NGINX en localhost
response=$(curl -s -o /dev/null -w "%{http_code}" http://localhost)

# Verifica si el código de respuesta es 200 (OK)
if [ "$response" == "200" ]; then
    echo "La aplicación está funcionando correctamente."
    exit 0
else
    echo "La aplicación no está funcionando correctamente. Código de respuesta: $response"
    exit 1
fi
