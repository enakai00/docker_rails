#!/bin/sh

DB_IP="<%= ENV.fetch('DB_PORT_5432_TCP_ADDR') %>"
DB_PORT="<%= ENV.fetch('DB_PORT_5432_TCP_PORT') %>"

echo '*:*:*:postgres:pas4pgsql' > /root/.pgpass
chmod 600 /root/.pgpass
psql -h $DB_PORT_5432_TCP_ADDR -U postgres -c \
    "create user rails encrypted password 'pas4rails'"
psql -h $DB_PORT_5432_TCP_ADDR -U postgres -c \
    "drop database if exists dengonban_production"
psql -h $DB_PORT_5432_TCP_ADDR -U postgres -c \
    "create database dengonban_production owner rails"
mkdir /root/rails
cd /root/rails
rails new dengonban -d postgresql
cd dengonban
echo "gem 'therubyracer', platforms: :ruby" >> Gemfile
sed -i "s/\(username\):.*/\1: rails/" \
  config/database.yml
sed -i "s/\(password\):.*/\1: pas4rails\n\
  host: $DB_IP\n  port: $DB_PORT/" \
  config/database.yml
sed -i "s/# \(config.time_zone\) =.*/\1 = 'Tokyo'/" \
    config/application.rb
sed -i "s/\(config.serve_static_assets\) =.*/\1 = true/" \
    config/environments/production.rb
RAILS_ENV=production bundle exec rake assets:precompile
rails generate scaffold Message name:string content:text date:datetime
rake db:migrate RAILS_ENV="production"
