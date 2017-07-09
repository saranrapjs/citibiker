CREATE TABLE my_trips_raw (
  first_name varchar,
  last_name varchar,
  username varchar,
  email varchar,
  gender integer,
  birth_year integer,
  dob timestamp without time zone,
  member_since timestamp without time zone,

  start_time timestamp without time zone,
  trip_duration numeric,
  start_station_name varchar,
  end_station_name varchar,

  start_station_id integer,
  end_station_id integer
);