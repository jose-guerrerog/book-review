#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean

# If you're using a Free instance type, you need to
# perform database migrations in the build command.
# Uncomment the following line:

RAILS_ENV=production RAILS_SERVE_STATIC_FILES=true SECRET_KEY_BASE=temp bundle exec rake assets:clean assets:precompile --trace
bundle exec rails db:migrate