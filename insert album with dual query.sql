insert into Album 
select null, "The Shins album", "10/2/2017", 234, "blah", Artist.ArtistId, Genre.genreId
from Artist, Genre
where Artist.ArtistName = "The Shins"
and Genre.Label = "Pop"