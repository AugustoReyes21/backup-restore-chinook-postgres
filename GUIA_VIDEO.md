# Guia rapida para grabar el video

Duracion maxima: 3 minutos.

## Orden sugerido

1. Mostrar el archivo `docker-compose.yml`.

```bash
cat docker-compose.yml
```

2. Levantar PostgreSQL con Docker Compose.

```bash
docker compose up -d
```

Si se muestra la configuracion de conexion, indicar que PostgreSQL queda disponible para pgAdmin en `localhost`, puerto `5434`, usuario `postgres` y contrasena `Buenas123`.

3. Mostrar que el contenedor esta activo.

```bash
docker ps
```

4. Copiar el backup al contenedor.

```bash
docker cp backup/Chinook_PostgreSql.sql chinook-postgres:/tmp/Chinook_PostgreSql.sql
```

5. Ingresar al contenedor.

```bash
docker exec -it chinook-postgres sh
```

6. Ejecutar el restore.

```bash
psql -U postgres < /tmp/Chinook_PostgreSql.sql
```

7. Validar dentro del contenedor.

```bash
psql -U postgres -d chinook -c "\dt"
psql -U postgres -d chinook -c "SELECT COUNT(*) FROM artist;"
psql -U postgres -d chinook -c "SELECT COUNT(*) FROM track;"
```

8. Salir del contenedor.

```bash
exit
```

## Guion oral breve

En este video muestro una practica de backup y restore usando PostgreSQL y Docker Compose. Primero levanto un contenedor de PostgreSQL definido en `docker-compose.yml`. Luego copio el archivo de backup de Chinook al contenedor y ejecuto el restore con `psql`. Finalmente valido que la base fue restaurada mostrando sus tablas y consultando la cantidad de registros en tablas como `artist` y `track`.

## Antes de entregar

- Subir el video a Google Drive.
- Activar permisos de visualizacion para quien tenga el enlace.
- Crear un repositorio publico en GitHub.
- Subir estos archivos al repositorio.
- Completar `INFORME.md` con nombre, enlace del video y enlace del repositorio.
- Exportar el informe como PDF.
