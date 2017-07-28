require 'active_record'

DATABASE_ENV = ENV['DATABASE_ENV'] || 'development'

path = File.join(ENV['ROOT_PATH'], "config", "databases.yml")

config = YAML.load_file(path)[DATABASE_ENV]
config['database'] = File.join(ENV['ROOT_PATH'], config['database'])
ActiveRecord::Base.establish_connection config