select count() as "number of songs", g.label "Genre"
from Song s, Genre g
where g.genreid = s.genreid 
group by g.label