require_relative './repository'
require_relative './repository_persister.rb'

repository = Repository.new(ENV['CRAN_URL'])
RepositoryPersister.new(repository).call(50)
