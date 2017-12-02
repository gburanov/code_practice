require "./repository"
require "./repository_persister.rb"

repository = Repository.new("https://cran.r-project.org/src/contrib/")
RepositoryPersister.new(repository).call(50)
