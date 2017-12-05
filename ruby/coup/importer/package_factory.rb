require 'attr_extras'
require 'rubygems/package'
require 'zlib'
require 'dcf'
require 'open-uri'

require_relative './package.rb'
require_relative './author.rb'
require_relative './author_factory'

class PackageFactory
  rattr_initialize :name, :version, :url

  def extract
    open(file) do |opened|
      opened.set_encoding(Encoding::UTF_8)
      process_file(opened)
    end
  end

  private

  def process_file(opened)
    zlib_file = Zlib::GzipReader.new(opened)
    opened.set_encoding(Encoding::UTF_8)
    Gem::Package::TarReader.new(zlib_file) do |tar_extracter|
      tar_extracter.each do |entry|
        if entry.full_name.end_with?('DESCRIPTION')
          return parse_description(entry.read)
        end
      end
    end
  end

  def parse_description(description)
    description.force_encoding(Encoding::UTF_8)
    attributes = Dcf.parse(description).first
    package =  Package.new(mapping(attributes))
    package.authors << AuthorFactory.new(attributes).call
    package
  end

  def mapping(attributes)
    {
      name: attributes['Package'],
      version: attributes['Version'],
      date: attributes['Date'] || attributes['Date/Publication'],
      title: attributes['Title'],
      description: attributes['Description']
    }
  end

  def file
    URI("#{url}/#{name}_#{version}.tar.gz").to_s
  end
end
