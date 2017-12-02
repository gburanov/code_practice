require_relative './repository'
require_relative './repository_persister.rb'

repository = Repository.new("https://cran.r-project.org/src/contrib/")
RepositoryPersister.new(repository).call(50)
