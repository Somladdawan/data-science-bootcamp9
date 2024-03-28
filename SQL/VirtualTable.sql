

-- Create a virtual table
CREATE VIEW genre_stats AS
		SELECT
				ge.name,
		    COUNT(*) as count_tracks,
		    AVG(milliseconds) AS avg_milliseconds
		FROM artists       AS ar
				JOIN albums  AS al ON ar.artistid = al.artistid
				JOIN tracks  AS tr ON tr.albumid = al.albumid
				JOIN genres  AS ge ON ge.genreid = tr.genreid
		GROUP BY 1
		ORDER BY 3 DESC
		LIMIT 5;

-- View
select * from genre_stats

-- To edit a view in SQL
AlTER VIEW genre_stats AS
		SELECT
				ge.name,
		    COUNT(*) as count_tracks,
		    AVG(milliseconds) AS avg_milliseconds
		FROM artists       AS ar
				JOIN albums  AS al ON ar.artistid = al.artistid
				JOIN tracks  AS tr ON tr.albumid = al.albumid
				JOIN genres  AS ge ON ge.genreid = tr.genreid
		GROUP BY 1
		ORDER BY 3 DESC
		LIMIT 5;
