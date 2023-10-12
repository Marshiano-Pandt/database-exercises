-- Use the albums_db database.
SHOW databases;
USE albums_db;
SELECT database();
SHOW tables;
USE albums_db;
SHOW tables;
SELECT * FROM albums;
DESCRIBE albums;
SELECT * 
FROM artist;
SELECT name, release_date FROM albums WHERE release_date > 1989 and release_date < 2000;
SELECT artist, name FROM albums WHERE artist = "Pink Floyd";
SELECT release_date, artist, name FROM albums WHERE name = "Sgt. Pepper\'s Lonely Hearts Club Band";
SELECT name, artist, genre FROM albums where name = "Nevermind";
SELECT name, artist, release_date, genre, sales as low_selling_albums FROM albums WHERE sales < 20.0;
DESCRIBE albums;




-- What is the primary key for the albums table?
-- id is the primary key for albums.

-- What does the column named 'name' represent?
-- It represents the name of the album.

-- What do you think the sales column represents?
-- I think the sales column represents the sale of each album from a certain period of time.

-- Find the name of all albums by Pink Floyd.
-- The Dark Side of the Moon and The Wall. 

-- What is the year Sgt. Pepper's Lonely Hearts Club Band was released?
-- 1967

-- What is the genre for the album Nevermind?
-- Grunge, Alternative rock

-- Which albums were released in the 1990s?
-- The Bodyguard, Jagged Little Pill, Come On Over, Falling into You, Let's Talk About Love, Dangerous, 
-- The Immaculate Collection, Titanic: Music from the Motion Picture, Metallica, Nevermind, Supernatural

-- Which albums had less than 20 million certified sales? Rename this column as low_selling_albums.
-- Grease: The Original Soundtrack from the Motion Picture, Sgt. Pepper's Lonely Hearts Club Band, 
-- Dirty Dancing, Let's Talk About Love, Dangerous, The Immaculate Collection, Abbey Road, Born in the U.S.A., 
-- Brothers in Arms, Titanic: Music from the Motion Picture, Nevermind, The Wall.