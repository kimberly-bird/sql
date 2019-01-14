insert into Album
select null, "the title", "2019", 234, "label", artist.ArtistId, Genre.GenreId
from artist, Genre
where Artist.ArtistName = "Black Flag"
and Genre.Label = "Punk"