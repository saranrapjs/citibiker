COPY (
    SELECT
        t.*
    FROM
        trips t,
        my_trips_raw me
    WHERE
        date_trunc('minute', t.start_time) = date_trunc('minute', me.start_time) AND
        t.trip_duration > me.trip_duration - 2 AND
        t.trip_duration < me.trip_duration + 2 AND
        t.gender = me.gender AND
        t.birth_year = me.birth_year
) TO stdout WITH CSV DELIMITER ',' HEADER;