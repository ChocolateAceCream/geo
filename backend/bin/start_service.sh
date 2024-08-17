#!/bin/bash

export RAILS_ENV=production
bundle install
rake db:seed
rails s -e production -b 0.0.0.0