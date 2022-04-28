require 'sqlite3'
require "amazing_print"

db = SQLite3::Database.new('chinook.sqlite')


# List all customers (name + email), ordered alphabetically (no extra information)
query1 = <<-SQL
SELECT last_name, email
FROM customers
ORDER BY last_name ASC
SQL

results1 = db.execute(query1)

# Should yield 59 results

# List tracks (Name + Composer) of the Classical playlist
query2 = <<-SQL
SELECT tracks.name, tracks.composer
FROM tracks
JOIN playlist_tracks ON tracks.id = playlist_tracks.track_id
JOIN playlists ON playlists.id = playlist_tracks.playlist_id
WHERE playlists.name = 'Classical'
SQL
results2 = db.execute(query2)
# Should yield 75 results

# List the 10 artists mostly listed in all playlists
query3 = <<-SQL
SELECT artists.name, COUNT(*) AS c
FROM artists
JOIN albums ON albums.artist_id = artists.id
JOIN tracks ON tracks.album_id = albums.id
JOIN playlist_tracks ON playlist_tracks.track_id = tracks.id
GROUP BY artists.id
ORDER BY c DESC
LIMIT 10
SQL

results3 = db.execute(query3)
results3
# First result should be Iron Maiden with 516 occurrences

# List the tracks which have been purchased at least twice, ordered by number of purchases
query4 = <<-SQL
SELECT tracks.name, COUNT(*) AS c
FROM tracks
JOIN invoice_lines ON tracks.id = invoice_lines.track_id
GROUP BY invoice_lines.track_id
HAVING c > 1
ORDER BY c DESC
LIMIT 10
SQL

results4 = db.execute(query4)
ap results4

# Should yield 265 results, Steve Harris - The Trooper having 5 purchases being the top bought track
