#!bin/sh

sudo docker exec mastodon_db_1 pg_dumpall -U postgres > dump.sql
