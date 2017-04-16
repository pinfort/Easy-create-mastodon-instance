#!bin/sh

sudo docker exec mastodon_redis_1 service redis stop
sudo docker exec mastodon_redis_1 cp backup.rdb mastodon_redis_1:/data/dump.rdb
sudo docker exec mastodon_redis_1 service redis start
