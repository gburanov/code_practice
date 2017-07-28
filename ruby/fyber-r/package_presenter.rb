require "attr_extras"
require "byebug"

class PackagePresenter
  rattr_initialize :package

  def call
    puts show_package
    puts "Authors #{show_authors}"
  end

  def show_package
    "Name #{package.name}, Version #{package.version}, Date #{package.date}, Title #{package.title}, Descripton #{package.description}"
  end

  def show_authors
    package.authors.map do |a|
      "#{a.name}-#{a.email}"
    end.join(', ')
  end
end
