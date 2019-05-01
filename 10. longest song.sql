---- SQLite ----
SELECT MAX(SongLength) as "Longest Song", Song.Title as "Song Title", Album.Title as "Album Title"
FROM Song, Album
where song.AlbumId = Album.albumId

---- SQL Server ----
SELECT 
  Title,
  SongLength
FROM Song 
WHERE SongLength = (SELECT MAX(SongLength) FROM Song)
