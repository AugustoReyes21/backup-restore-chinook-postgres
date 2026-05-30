# Backup y Restore de Base de Datos - Chinook con PostgreSQL

Este repositorio contiene una practica de backup y restore usando PostgreSQL, Docker Compose y la base de datos de ejemplo Chinook.

## Arquitectura utilizada

La arquitectura esta compuesta por:

- Un servicio `postgres` definido en `docker-compose.yml`.
- Una imagen oficial `postgres:16`.
- Un volumen Docker llamado `postgres_data` para persistir los datos del contenedor.
- Un archivo de backup SQL ubicado en `backup/Chinook_PostgreSql.sql`.
- Un archivo de validacion ubicado en `evidence/validacion.sql`.

El contenedor expone PostgreSQL en el puerto `5432` y usa el usuario `postgres` con password `postgres`, solamente para fines academicos/locales.

## Conceptos

**Backup:** es una copia de seguridad de los datos de una base de datos. Permite conservar la informacion para recuperarla si ocurre un error, perdida de datos o incidente.

**Restore:** es el proceso de recuperar una base de datos a partir de un backup. En esta practica, el restore carga el script SQL de Chinook dentro del contenedor PostgreSQL.

## Requisitos

- Docker
- Docker Compose
- Git

## Ejecucion del proyecto

1. Levantar el contenedor:

```bash
docker compose up -d
```

2. Verificar que el contenedor este en ejecucion:

```bash
docker ps
```

3. Copiar el backup al contenedor:

```bash
docker cp backup/Chinook_PostgreSql.sql chinook-postgres:/tmp/Chinook_PostgreSql.sql
```

4. Ingresar al contenedor:

```bash
docker exec -it chinook-postgres sh
```

5. Ejecutar el restore dentro del contenedor:

```bash
psql -U postgres < /tmp/Chinook_PostgreSql.sql
```

6. Salir del contenedor:

```bash
exit
```

## Validacion de la base restaurada

Para validar que la base de datos fue restaurada correctamente, usar consultas simples:

```bash
docker exec -it chinook-postgres psql -U postgres -d chinook -c "\dt"
docker exec -it chinook-postgres psql -U postgres -d chinook -c "SELECT COUNT(*) FROM artist;"
docker exec -it chinook-postgres psql -U postgres -d chinook -c "SELECT COUNT(*) FROM track;"
```

Tambien se puede copiar y ejecutar el archivo de validacion:

```bash
docker cp evidence/validacion.sql chinook-postgres:/tmp/validacion.sql
docker exec -it chinook-postgres psql -U postgres -d chinook -f /tmp/validacion.sql
```

Resultados esperados principales:

- La base de datos `chinook` debe existir.
- Deben aparecer tablas como `album`, `artist`, `customer`, `employee`, `invoice`, `track`, entre otras.
- La consulta de artistas debe devolver registros cargados.

## Fuente del backup

El archivo `backup/Chinook_PostgreSql.sql` fue obtenido del repositorio publico de Chinook Database:

https://github.com/lerocha/chinook-database

Ruta original:

https://raw.githubusercontent.com/lerocha/chinook-database/master/ChinookDatabase/DataSources/Chinook_PostgreSql.sql

## Comandos utiles para el video

Mostrar el archivo `docker-compose.yml`:

```bash
cat docker-compose.yml
```

Levantar el contenedor y mostrar evidencia:

```bash
docker compose up -d
docker ps
```

Copiar backup:

```bash
docker cp backup/Chinook_PostgreSql.sql chinook-postgres:/tmp/Chinook_PostgreSql.sql
```

Ingresar al contenedor:

```bash
docker exec -it chinook-postgres sh
```

Restaurar:

```bash
psql -U postgres < /tmp/Chinook_PostgreSql.sql
```

Validar:

```bash
psql -U postgres -d chinook -c "\dt"
psql -U postgres -d chinook -c "SELECT COUNT(*) FROM artist;"
```

## Limpieza del ambiente

Detener el contenedor:

```bash
docker compose down
```

Eliminar tambien el volumen de datos:

```bash
docker compose down -v
```

## Datos para el entregable PDF

- Nombre completo: agregar aqui el nombre del estudiante.
- Enlace al video de Google Drive: agregar aqui el enlace con permisos de visualizacion.
- Enlace al repositorio publico de GitHub: agregar aqui el enlace del repositorio.

## Guia para grabar

El archivo `GUIA_VIDEO.md` contiene un orden sugerido para grabar el video de maximo 3 minutos.
