-------- SQLite --------
SELECT MAX(AlbumLength) as "Longest Album", Album.Title
FROM Album

-------- SQL SERVER --------
SELECT 
  Title,
  AlbumLength
FROM Album
WHERE AlbumLength = (SELECT MAX(AlbumLength) FROM Album)
