select al.title, a.ArtistName
from Artist a
left join Album al on al.ArtistId = a.ArtistId