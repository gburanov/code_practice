require "./repository.rb"

class RepositoryPersister
  rattr_initialize :repository

  def call(max_numbers)
    it = 0
    repository.parse do |package|
      puts "Parsed package #{package}"
      ret = package.save
      if ret == false
        puts "Already persisted"
      else
        puts package.persisted?
      end
      it += 1
      break if it > max_numbers
    end
  end
end
