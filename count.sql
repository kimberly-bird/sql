select count() as numberOfSongs, artist.artistname
from Song, Artist
where song.artistid = artist.ArtistId
group by song.artistid