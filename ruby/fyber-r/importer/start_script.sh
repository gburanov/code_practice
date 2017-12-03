#!/bin/bash

rake db:create
rake db:migrate
DATABASE_ENV=production ruby import.rb &
DATABASE_ENV=production ruby server.rb
