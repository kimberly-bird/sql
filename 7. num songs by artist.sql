select count() as "number of songs", ar.artistname "Artist"
from Song s, Artist ar
where ar.artistid = s.artistid 
group by ar.artistId