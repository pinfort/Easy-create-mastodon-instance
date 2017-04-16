#!bin/sh

cat dump.sql | sudo docker exec -i mastodon_db_1 psql -U postgres
