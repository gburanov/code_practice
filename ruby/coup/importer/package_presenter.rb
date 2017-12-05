require 'attr_extras'

class PackagePresenter
  rattr_initialize :package

  def call(stream)
    stream << show_package << "\n"
    stream << "Authors #{show_authors}" << "\n"
    stream << "\n"
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
