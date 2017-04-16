#!bin/sh

# sudo docker exec mastodon_redis_1 redis_cli bgsave
sudo docker exec mastodon_redis_1 redis-cli save
sudo docker cp mastodon_redis_1:/data/dump.rdb backup.rdb
