USE codeup_test_db;

SELECT 'Albums released after 1991 DELETED!' AS '> 1991';
DELETE FROM albums WHERE release_date > 1991;

SELECT 'Albums with the genre ''disco'' DELETED!' AS 'DISCO';
DELETE FROM albums WHERE genre = 'disco';

SELECT 'Albums by ''Whitney Houston'' DELETED!' AS 'Whitney Houston';
DELETE FROM albums WHERE artist= 'Whitney Houston';

