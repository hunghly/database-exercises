USE codeup_test_db;

SELECT 'All Albums' AS 'Albums';
SELECT * from albums;
SELECT 'All Albums with 10x sales!' AS 'Albums';

UPDATE albums
SET  sales = (sales * 10);
SELECT * from albums;

SELECT 'All Albums before 1980' AS '< 1980';
SELECT * from albums WHERE release_date < 1980;

SELECT 'All Albums before 1980 changed to 1800''s' AS '< 1980';
UPDATE albums
SET release_date = release_date - 100
WHERE release_date < 1980;
SELECT * from albums WHERE release_date < 1980;

SELECT 'All Michael Jackson Albums' AS 'Michael Jackson Albums';
SELECT * from albums WHERE artist ='Michael Jackson';

SELECT 'Change Michael to Peter Jackson Albums' AS 'Peter Jackson Albums';
UPDATE albums
SET artist = 'Peter Jackson'
WHERE artist = 'Michael Jackson';
SELECT * from albums WHERE artist ='Peter Jackson';

