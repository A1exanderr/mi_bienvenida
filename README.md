# mi_bienvenida

# Autor

>Alkey developer

>EMPRESA ITI CORP

## COMANDOS DE DOCKER PARA ARRANCAR
ver los docker en linea

docker ps


Levantar el entorno en segundo plano

docker-compose up --build -d


Levantar el entorno en segundo plano si no tienes modificaciones del entorno

docker-compose up -d


Detener el entorno en ejecucion 

docker-compose down


Entrar a un contenedor para ejecutar el comando

docker exec -it farmacia_app bash

composer install


## Comandos de Docker eliminar
Ver el volumen

volume ls


Eliminar el volumen

docker volume rm farmacia_notificacion_telegram_pgdata


Eliminar imágenes no utilizadas

docker image prune


O para eliminar todas las imágenes no usadas por ningún contenedor (dangling + orphaned):

docker image prune -a


Eliminar contenedores detenidos

docker container prune


Ver todos los contenedores (incluso detenidos)

docker ps -a


Ver contenedores en ejecución

docker ps


## Comandos de git mas usadas
ver en que rama estas

git branch


cambiarse de la rama

git checkout nombre-de-la-rama


Bajar de una rama los cambios

git pull origin nombre-de-la-rama


## Subir a la misma rama
git status

git add .

git commit -m "detalles"

git push

## Git comandos estras
ver las ramas remotas

git branch -r


Si la rama no existe localmente pero sí en remoto:

git checkout -b nombre-de-la-rama origin/nombre-de-la-rama


Ver todas las ramas locales y remotas

git branch -a


Crear una rama sin cambiarte a ella:

git branch nombre-de-la-rama


Crear una rama y cambiarte a ella al mismo tiempo:

git checkout -b nombre-de-la-rama


Subir la rama al remoto (después de crearla):

git push -u origin nombre-de-la-rama
