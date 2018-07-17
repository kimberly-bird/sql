select al.title || " by " || ar.artistname as "Album and Artist"
from Album al, Artist ar
where al.artistid = ar.artistid