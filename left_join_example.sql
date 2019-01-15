-- not all artists have an album, so left join brings back all artists and is null for the artists with no album
select a.artistname, al.title
from artist a
left join album al on a.artistid = al.artistid