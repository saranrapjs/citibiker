[WIP] Scrape your personal ride data from the citibike website using nightmare.js.

```
npm install
CITIBIKE_EMAIL="one@two.com"  CITIBIKE_PASSWORD="xxxyyyzzz"  node scrape.js
node process.js
cat trips.json
```

---

## Identifying your trips in the public record

Starting with db created by [this cool project](http://toddwschneider.com/posts/a-tale-of-twenty-two-million-citi-bikes-analyzing-the-nyc-bike-share-system/)

```bash
    psql nyc-citibike-data -f create_schema.sql
    cat trips.csv | psql nyc-citibike-data -f import_trips.sql
```

Now identify your trips from the global trip record:
The trip start times + durations are sometimes off by a second,
so there is a range for start time and trip duration,
which is slow but seems to identify all the trips.

```sql
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
        t.birth_year = me.birth_year;
```

To do the same, back out to CSV:

```bash
    psql nyc-citibike-data -f export_identified_trips.sql > identified_trips.csv
```

---

Credits

* http://stackoverflow.com/questions/34596811/dynamic-paging-with-nightmare-electron-page-scrape
* https://github.com/toddwschneider/nyc-citibike-data
