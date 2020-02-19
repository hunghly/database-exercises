USE codeup_test_db;


#The name of all albums by Pink Floyd.
SELECT 'Here is a list of all records from Pink Floyd' AS 'Pink Floyd''s Records';
SELECT *
FROM albums
WHERE artist = 'Pink Floyd';
# The year Sgt. Pepper's Lonely Hearts Club Band was released
SELECT 'Here is the year that Sgt. Pepper''s Lonely Hearts Club Band was released' AS 'Lonely Heart''s Club';
SELECT release_date
from albums
where name = 'Sgt. Pepper''s Lonely Hearts Club Band';
# The genre for Nevermind
SELECT 'Here''s the genre for Nevermind' AS 'Genre';
SELECT genre
from albums
where name = 'Nevermind';
# Which albums were released in the 1990s
SELECT 'Here are the albums released in the 1990s' AS '90''s albums';
SELECT artist, name, release_date, genre
from albums
WHERE release_date BETWEEN 1990 AND 1999;
# Which albums had less than 20 million certified sales
SELECT 'The list of albums with less than 20 million certified sales' AS '<20 million sales';
SELECT name, sales
from albums
WHERE sales < 20.00;
# All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
SELECT 'The list of albums with ''Rock'' as genre' AS 'Rock Albums';
select artist, name, genre from albums where genre='Rock';
# SELECT artist, name, genre from albums WHERE genre LIKE '%rock%';