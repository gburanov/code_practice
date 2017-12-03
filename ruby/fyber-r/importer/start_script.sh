#!/bin/bash

rake db:create
rake db:migrate
ruby import.rb &
ruby server.rb
