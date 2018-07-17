select s.title as "Song Name", al.title as "Album Name", ar.artistname as "Artist Name"
from Song s, Album al
left join Artist ar
where s.artistId = al.artistid
and s.artistid = ar.artistid
and s.title = "song title"
