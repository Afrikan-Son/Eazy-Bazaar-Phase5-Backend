#!/usr/bin/env bash
# exit on error
set -o errexit

# Build commands for back end
bundle install
bundle exec rake db:drop
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate 
bundle exec rake db:seed # if you have seed data, run this command for the initial deploy only to avoid duplicate records
