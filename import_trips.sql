COPY my_trips_raw FROM stdin WITH CSV HEADER;

UPDATE my_trips_raw
SET start_station_id = s.id
FROM stations s
WHERE my_trips_raw.start_station_name = s.name;

UPDATE my_trips_raw
SET end_station_id = s.id
FROM stations s
WHERE my_trips_raw.end_station_name = s.name;