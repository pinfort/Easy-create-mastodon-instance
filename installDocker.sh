#!/bin/sh

curl 'https://github.com/tootsuite/mastodon/archive/v1.2.tar.gz' > mastodon.tar.gz
# mv v1.1.2.tar.gz mastodon.tar.gz
tar -zxvf mastodon.tar.gz
mv mastodon-1.2 mastodon
cd mastodon
sudo yum install -y docker
sudo systemctl start docker
sudo systemctl enable docker
# VERSION_NUM=1.12.0
sudo curl -L "https://github.com/docker/compose/releases/download/1.12.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
echo 'please add /usr/local/bin to secure_path'
echo 'push enter key to edit'
read Wait
visudo
cp .env.production.sample .env.production
sudo docker-compose version
sudo docker-compose build
sudo docker-compose run --rm web rake secret
sudo docker-compose run --rm web rake secret
sudo docker-compose run --rm web rake secret
echo 'please input secrets into .env.production'
echo 'set domain & SMTP setting'
echo 'push enter key...'
read Wait
vi .env.production
sudo docker-compose run --rm web rails db:migrate
sudo docker-compose run --rm web rails assets:precompile
sudo docker-compose up -d
echo 'now, you can access http://localhost:3000'
echo 'push enter key to end'
read Wait
