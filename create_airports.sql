CREATE TABLE temp_airports (
    id INTEGER,
    ident TEXT,
    type TEXT,
    name TEXT,
    latitude_deg DOUBLE PRECISION,
    longitude_deg DOUBLE PRECISION,
    elevation_ft INTEGER,
    continent TEXT,
    iso_country TEXT,
    iso_region TEXT,
    municipality TEXT,
    scheduled_service TEXT,
    icao_code TEXT,
    iata_code TEXT,
    gps_code TEXT,
    local_code TEXT,
    home_link TEXT,
    wikipedia_link TEXT,
    keywords TEXT
);

CREATE TABLE airports (
    name TEXT,
    iata_code TEXT,
    latitude_deg DOUBLE PRECISION,
    longitude_deg DOUBLE PRECISION
);


INSERT INTO airports(name, iata_code, latitude_deg, longitude_deg)
SELECT name, iata_code, latitude_deg, longitude_deg
FROM temp_airports
WHERE iata_code IS NOT NULL AND iata_code <> '';