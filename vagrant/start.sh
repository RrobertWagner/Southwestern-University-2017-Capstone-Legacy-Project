#!/bin/bash --login

sudo apt-get update
sudo apt-get install -y nodejs sqlite3 libsqlite3-dev imagemagick

cd /vagrant
rvm use 2.1.5
bundle install
rake db:migrate
rails s -b 0.0.0.0 -d
