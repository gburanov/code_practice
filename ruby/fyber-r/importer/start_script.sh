#!/bin/bash

rake 'db:create'
rake 'db:seed'
ruby start.rb
