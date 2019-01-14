select count() as "number of songs", al.title "Album Title"
from Song s
join Album al on al.albumid = s.albumid 
group by al.albumid