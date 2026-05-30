SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;

SELECT COUNT(*) AS total_artistas FROM artist;
SELECT COUNT(*) AS total_albumes FROM album;
SELECT COUNT(*) AS total_tracks FROM track;

SELECT artist_id, name
FROM artist
ORDER BY artist_id
LIMIT 5;
