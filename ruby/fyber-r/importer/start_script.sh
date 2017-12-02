#!/bin/bash

rake db:create
rake db:migrate
ruby start.rb
