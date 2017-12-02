require "./repository.rb"

class RepositoryPersister
  rattr_initialize :repository

  def call(max_number)
    it = 0
    repository.parse do |package|
      puts "Parsing... package #{package}"
      puts "Already persisted" unless package.save == false
      it += 1
      break if it > max_number
    end
  end
end
