--Database
chinook.db


-- CASE WHEN THEN ELSE END
SELECT
	bytes/(1024*1024) AS mb,
    -- if else in SQL
    CASE
    	WHEN bytes/(1024*1024) >=8 THEN "Large"
        WHEN bytes/(1024*1024) >=3 THEN "Medium"
        ELSE "Small"
    END AS segment
FROM tracks;

-- Clean Null
SELECT
	company,
    COALESCE(company, "B2C") AS clean_company,
    CASE
    	WHEN company IS NULL THEN "B2C"
        ELSE "B2B"
    END AS segment
FROM customers;

-- Group By
SELECT 
    CASE
    	WHEN bytes/(1024*1024) >=8 THEN "Large"
        WHEN bytes/(1024*1024) >=3 THEN "Medium"
        ELSE "Small"
    END AS segment,
    COUNT(*) AS num_song
FROM tracks
Group by 1;

--Haveing
SELECT 
	genres.name, 
	COUNT(*) AS count_songs
FROM genres, tracks
WHERE genres.genreid = tracks.genreid
GROUP BY genres.name
HAVING count_songs >= 100;

--Join Table
SELECT *
FROM artists AS ar
JOIN albums AS al
ON ar.artistid = al.artistid;

-- Aggregate + Join 
SELECT
    ge.name, -- ดึงเพลง , นับแต่ละgenreมีกี่เพลง, avgความยาว
    count(*) AS count_tracks,
    AVG(milliseconds) AS avg_milliseconds
FROM artists AS ar
INNER JOIN albums AS al
	ON ar.artistid = al.artistid
INNER JOIN tracks AS tr
	ON al.albumid = tr.albumid
INNER JOIN genres AS ge
	ON ge.genreid = tr.genreid
GROUP BY 1
ORDER BY 3 DESC
LIMIT 5;
