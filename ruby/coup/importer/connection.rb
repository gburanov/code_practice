require 'active_record'
require 'yaml'

DATABASE_ENV = ENV['DATABASE_ENV'] || 'development'
config = YAML.load_file('config/databases.yml')[DATABASE_ENV]
ActiveRecord::Base.establish_connection(config)
