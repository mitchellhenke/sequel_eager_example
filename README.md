```zsh
createdb sequel_example
bundle
ruby example.rb

I, [2015-02-26T12:34:24.252213 #44756]  INFO -- : (0.000314s) SET standard_conforming_strings = ON
I, [2015-02-26T12:34:24.252485 #44756]  INFO -- : (0.000175s) SET client_min_messages = 'WARNING'
I, [2015-02-26T12:34:24.252712 #44756]  INFO -- : (0.000180s) SET DateStyle = 'ISO'
I, [2015-02-26T12:34:24.253328 #44756]  INFO -- : (0.000369s) CREATE TABLE IF NOT EXISTS "artists" ("id" serial PRIMARY KEY, "name" text)
I, [2015-02-26T12:34:24.253692 #44756]  INFO -- : (0.000151s) CREATE TABLE IF NOT EXISTS "albums" ("id" serial PRIMARY KEY, "name" text, "artist_id" integer REFERENCES "artists")
I, [2015-02-26T12:34:24.254049 #44756]  INFO -- : (0.000148s) CREATE TABLE IF NOT EXISTS "songs" ("id" serial PRIMARY KEY, "name" text, "album_id" integer REFERENCES "albums")
I, [2015-02-26T12:34:24.260383 #44756]  INFO -- : (0.005143s) SELECT "pg_attribute"."attname" AS "name", CAST("pg_attribute"."atttypid" AS integer) AS "oid", CAST("basetype"."oid" AS integer) AS "base_oid", format_type("basetype"."oid", "pg_type"."typtypmod") AS "db_base_type", format_type("pg_type"."oid", "pg_attribute"."atttypmod") AS "db_type", pg_get_expr("pg_attrdef"."adbin", "pg_class"."oid") AS "default", NOT "pg_attribute"."attnotnull" AS "allow_null", COALESCE(("pg_attribute"."attnum" = ANY("pg_index"."indkey")), false) AS "primary_key" FROM "pg_class" INNER JOIN "pg_attribute" ON ("pg_attribute"."attrelid" = "pg_class"."oid") INNER JOIN "pg_type" ON ("pg_type"."oid" = "pg_attribute"."atttypid") LEFT OUTER JOIN "pg_type" AS "basetype" ON ("basetype"."oid" = "pg_type"."typbasetype") LEFT OUTER JOIN "pg_attrdef" ON (("pg_attrdef"."adrelid" = "pg_class"."oid") AND ("pg_attrdef"."adnum" = "pg_attribute"."attnum")) LEFT OUTER JOIN "pg_index" ON (("pg_index"."indrelid" = "pg_class"."oid") AND ("pg_index"."indisprimary" IS TRUE)) WHERE (("pg_attribute"."attisdropped" IS FALSE) AND ("pg_attribute"."attnum" > 0) AND ("pg_class"."oid" = CAST(CAST('"artists"' AS regclass) AS oid))) ORDER BY "pg_attribute"."attnum"
I, [2015-02-26T12:34:24.264793 #44756]  INFO -- : (0.002237s) SELECT "pg_attribute"."attname" AS "name", CAST("pg_attribute"."atttypid" AS integer) AS "oid", CAST("basetype"."oid" AS integer) AS "base_oid", format_type("basetype"."oid", "pg_type"."typtypmod") AS "db_base_type", format_type("pg_type"."oid", "pg_attribute"."atttypmod") AS "db_type", pg_get_expr("pg_attrdef"."adbin", "pg_class"."oid") AS "default", NOT "pg_attribute"."attnotnull" AS "allow_null", COALESCE(("pg_attribute"."attnum" = ANY("pg_index"."indkey")), false) AS "primary_key" FROM "pg_class" INNER JOIN "pg_attribute" ON ("pg_attribute"."attrelid" = "pg_class"."oid") INNER JOIN "pg_type" ON ("pg_type"."oid" = "pg_attribute"."atttypid") LEFT OUTER JOIN "pg_type" AS "basetype" ON ("basetype"."oid" = "pg_type"."typbasetype") LEFT OUTER JOIN "pg_attrdef" ON (("pg_attrdef"."adrelid" = "pg_class"."oid") AND ("pg_attrdef"."adnum" = "pg_attribute"."attnum")) LEFT OUTER JOIN "pg_index" ON (("pg_index"."indrelid" = "pg_class"."oid") AND ("pg_index"."indisprimary" IS TRUE)) WHERE (("pg_attribute"."attisdropped" IS FALSE) AND ("pg_attribute"."attnum" > 0) AND ("pg_class"."oid" = CAST(CAST('"albums"' AS regclass) AS oid))) ORDER BY "pg_attribute"."attnum"
I, [2015-02-26T12:34:24.268927 #44756]  INFO -- : (0.002132s) SELECT "pg_attribute"."attname" AS "name", CAST("pg_attribute"."atttypid" AS integer) AS "oid", CAST("basetype"."oid" AS integer) AS "base_oid", format_type("basetype"."oid", "pg_type"."typtypmod") AS "db_base_type", format_type("pg_type"."oid", "pg_attribute"."atttypmod") AS "db_type", pg_get_expr("pg_attrdef"."adbin", "pg_class"."oid") AS "default", NOT "pg_attribute"."attnotnull" AS "allow_null", COALESCE(("pg_attribute"."attnum" = ANY("pg_index"."indkey")), false) AS "primary_key" FROM "pg_class" INNER JOIN "pg_attribute" ON ("pg_attribute"."attrelid" = "pg_class"."oid") INNER JOIN "pg_type" ON ("pg_type"."oid" = "pg_attribute"."atttypid") LEFT OUTER JOIN "pg_type" AS "basetype" ON ("basetype"."oid" = "pg_type"."typbasetype") LEFT OUTER JOIN "pg_attrdef" ON (("pg_attrdef"."adrelid" = "pg_class"."oid") AND ("pg_attrdef"."adnum" = "pg_attribute"."attnum")) LEFT OUTER JOIN "pg_index" ON (("pg_index"."indrelid" = "pg_class"."oid") AND ("pg_index"."indisprimary" IS TRUE)) WHERE (("pg_attribute"."attisdropped" IS FALSE) AND ("pg_attribute"."attnum" > 0) AND ("pg_class"."oid" = CAST(CAST('"songs"' AS regclass) AS oid))) ORDER BY "pg_attribute"."attnum"
I, [2015-02-26T12:34:24.279984 #44756]  INFO -- : (0.000130s) BEGIN
I, [2015-02-26T12:34:24.280637 #44756]  INFO -- : (0.000363s) INSERT INTO "artists" ("name") VALUES ('Beck') RETURNING *
I, [2015-02-26T12:34:24.281050 #44756]  INFO -- : (0.000330s) COMMIT
I, [2015-02-26T12:34:24.281279 #44756]  INFO -- : (0.000089s) BEGIN
I, [2015-02-26T12:34:24.281771 #44756]  INFO -- : (0.000327s) INSERT INTO "artists" ("name") VALUES ('Kanye West') RETURNING *
I, [2015-02-26T12:34:24.282216 #44756]  INFO -- : (0.000307s) COMMIT
I, [2015-02-26T12:34:24.283044 #44756]  INFO -- : (0.000119s) BEGIN
I, [2015-02-26T12:34:24.283932 #44756]  INFO -- : (0.000644s) INSERT INTO "albums" ("artist_id", "name") VALUES (25, 'The Beck Album 1') RETURNING *
I, [2015-02-26T12:34:24.284431 #44756]  INFO -- : (0.000380s) COMMIT
I, [2015-02-26T12:34:24.284718 #44756]  INFO -- : (0.000101s) BEGIN
I, [2015-02-26T12:34:24.285238 #44756]  INFO -- : (0.000342s) INSERT INTO "albums" ("artist_id", "name") VALUES (26, 'The College Dropout') RETURNING *
I, [2015-02-26T12:34:24.285636 #44756]  INFO -- : (0.000330s) COMMIT
I, [2015-02-26T12:34:24.286290 #44756]  INFO -- : (0.000129s) BEGIN
I, [2015-02-26T12:34:24.287488 #44756]  INFO -- : (0.000927s) INSERT INTO "songs" ("album_id", "name") VALUES (25, 'Beck Song 1') RETURNING *
I, [2015-02-26T12:34:24.289038 #44756]  INFO -- : (0.001200s) COMMIT
I, [2015-02-26T12:34:24.290134 #44756]  INFO -- : (0.000699s) BEGIN
I, [2015-02-26T12:34:24.292655 #44756]  INFO -- : (0.001802s) INSERT INTO "songs" ("album_id", "name") VALUES (25, 'Beck Song 2') RETURNING *
I, [2015-02-26T12:34:24.293737 #44756]  INFO -- : (0.000626s) COMMIT
I, [2015-02-26T12:34:24.294194 #44756]  INFO -- : (0.000157s) BEGIN
I, [2015-02-26T12:34:24.295086 #44756]  INFO -- : (0.000582s) INSERT INTO "songs" ("album_id", "name") VALUES (25, 'Beck Song 3') RETURNING *
I, [2015-02-26T12:34:24.296559 #44756]  INFO -- : (0.001350s) COMMIT
I, [2015-02-26T12:34:24.296991 #44756]  INFO -- : (0.000187s) BEGIN
I, [2015-02-26T12:34:24.297874 #44756]  INFO -- : (0.000625s) INSERT INTO "songs" ("album_id", "name") VALUES (25, 'Beck Song 4') RETURNING *
I, [2015-02-26T12:34:24.298313 #44756]  INFO -- : (0.000326s) COMMIT
I, [2015-02-26T12:34:24.298611 #44756]  INFO -- : (0.000121s) BEGIN
I, [2015-02-26T12:34:24.300531 #44756]  INFO -- : (0.000681s) INSERT INTO "songs" ("album_id", "name") VALUES (26, 'Kanye Song 1') RETURNING *
I, [2015-02-26T12:34:24.301003 #44756]  INFO -- : (0.000322s) COMMIT
I, [2015-02-26T12:34:24.301293 #44756]  INFO -- : (0.000107s) BEGIN
I, [2015-02-26T12:34:24.301926 #44756]  INFO -- : (0.000462s) INSERT INTO "songs" ("album_id", "name") VALUES (26, 'Kanye Song 2') RETURNING *
I, [2015-02-26T12:34:24.302263 #44756]  INFO -- : (0.000259s) COMMIT
I, [2015-02-26T12:34:24.302536 #44756]  INFO -- : (0.000106s) BEGIN
I, [2015-02-26T12:34:24.302974 #44756]  INFO -- : (0.000290s) INSERT INTO "songs" ("album_id", "name") VALUES (26, 'Kanye Song 3') RETURNING *
I, [2015-02-26T12:34:24.303296 #44756]  INFO -- : (0.000243s) COMMIT
I, [2015-02-26T12:34:24.303545 #44756]  INFO -- : (0.000111s) BEGIN
I, [2015-02-26T12:34:24.304009 #44756]  INFO -- : (0.000321s) INSERT INTO "songs" ("album_id", "name") VALUES (26, 'Kanye Song 4') RETURNING *
I, [2015-02-26T12:34:24.304337 #44756]  INFO -- : (0.000258s) COMMIT
I, [2015-02-26T12:34:24.304760 #44756]  INFO -- : (0.000281s) SELECT * FROM "artists"
I, [2015-02-26T12:34:24.307136 #44756]  INFO -- : (0.001265s) SELECT * FROM (SELECT *, row_number() OVER (PARTITION BY "albums"."artist_id") AS "x_sequel_row_number_x" FROM "albums" WHERE (("albums"."artist_id" IN (25, 26)) AND ("name" ILIKE 'The%' ESCAPE '\'))) AS "t1" WHERE ("x_sequel_row_number_x" <= 2)

** should be no queries below this **

I, [2015-02-26T12:34:24.307749 #44756]  INFO -- : (0.000252s) SELECT * FROM "songs" WHERE ("songs"."album_id" = 25)
I, [2015-02-26T12:34:24.308101 #44756]  INFO -- : (0.000219s) SELECT * FROM "songs" WHERE ("songs"."album_id" = 26)
```
