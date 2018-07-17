select count() as "number of songs", al.title "Album Title"
from Song s, Album al
where al.albumid = s.albumid 
group by al.albumid