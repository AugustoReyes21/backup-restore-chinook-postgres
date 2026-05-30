# Backup y Restore de Base de Datos

## Nombre completo

Agregar aqui el nombre completo del estudiante.

## Arquitectura utilizada

La practica utiliza una arquitectura local basada en Docker Compose. Se levanta un contenedor de PostgreSQL usando la imagen oficial `postgres:16`. El servicio se llama `postgres` y el contenedor se identifica como `chinook-postgres`.

La persistencia se maneja con un volumen Docker llamado `postgres_data`, el cual permite conservar los archivos internos de PostgreSQL aunque el contenedor sea detenido. El archivo de backup utilizado es `backup/Chinook_PostgreSql.sql`, que contiene las instrucciones SQL necesarias para crear y cargar la base de datos Chinook.

## Que es backup y que es restore

Un backup es una copia de seguridad de los datos de una base de datos. Su objetivo es permitir la recuperacion de informacion ante errores, eliminaciones accidentales, fallos tecnicos o incidentes.

Un restore es el proceso de recuperar una base de datos a partir de un backup. En esta practica, el restore se realizo ejecutando el archivo SQL de Chinook dentro del contenedor PostgreSQL mediante el comando `psql`.

## Pasos realizados

1. Se creo el archivo `docker-compose.yml` con el servicio de PostgreSQL.
2. Se levanto el contenedor con el comando `docker compose up -d`.
3. Se verifico que el contenedor estuviera activo con `docker ps`.
4. Se copio el archivo de backup al contenedor usando `docker cp`.
5. Se ingreso al contenedor con `docker exec -it chinook-postgres sh`.
6. Se ejecuto el restore con `psql -U postgres < /tmp/Chinook_PostgreSql.sql`.
7. Se valido la restauracion consultando las tablas y contando registros de tablas como `artist` y `track`.

## Comandos principales utilizados

```bash
docker compose up -d
docker ps
docker cp backup/Chinook_PostgreSql.sql chinook-postgres:/tmp/Chinook_PostgreSql.sql
docker exec -it chinook-postgres sh
psql -U postgres < /tmp/Chinook_PostgreSql.sql
psql -U postgres -d chinook -c "\dt"
psql -U postgres -d chinook -c "SELECT COUNT(*) FROM artist;"
psql -U postgres -d chinook -c "SELECT COUNT(*) FROM track;"
```

## Evidencia de validacion

La base de datos `chinook` fue restaurada correctamente porque se pudieron listar las tablas creadas y ejecutar consultas sobre los datos cargados.

Ejemplos de validacion:

```sql
SELECT COUNT(*) FROM artist;
SELECT COUNT(*) FROM track;
```

## Enlace al video en Google Drive

Agregar aqui el enlace del video con permisos de visualizacion.

## Enlace al repositorio publico de GitHub

Agregar aqui el enlace del repositorio publico.
