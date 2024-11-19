CREATE TABLE IF NOT EXISTS Genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Artist (
    id SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS ArtistGenre (
    artist_id INTEGER REFERENCES Artist(id),
    genre_id INTEGER REFERENCES Genre(id),
    CONSTRAINT pk PRIMARY KEY (artist_id, genre_id)
);

CREATE TABLE IF NOT EXISTS Album (
    id SERIAL PRIMARY KEY,
    title VARCHAR(60) NOT NULL,
    release_year INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS ArtistAlbum (
    artist_id INTEGER REFERENCES Artist(id),
    album_id INTEGER REFERENCES Album(id),
    CONSTRAINT pk PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE IF NOT EXISTS Track (
    id SERIAL PRIMARY KEY,
    title VARCHAR(60) NOT NULL,
    duration INTEGER NOT NULL,
    album_id INTEGER NOT NULL REFERENCES Album(id)
);

CREATE TABLE IF NOT EXISTS Collection (
    id SERIAL PRIMARY KEY,
    title VARCHAR(60) NOT NULL,
    release_year INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS TrackCollection (
    collection_id INTEGER REFERENCES Collection(id),
    track_id INTEGER REFERENCES Track(id),
    CONSTRAINT pk PRIMARY KEY (collection_id, track_id)
);


