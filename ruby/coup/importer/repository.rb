require 'attr_extras'
require 'open-uri'
require 'dcf'

require_relative './package_factory.rb'

class Repository
  attr_accessor :url

  def initialize(url)
    @package = ''
    @version = ''
    @url = url
  end

  # probably need to switch it to state machine
  def parse(&block)
    open(file) do |f|
      f.read.each_line { |line| read_line(line, &block) }
    end
  end

  def package(name, version)
    PackageFactory.new(name, version, url).extract
  end

  private

  def read_line(line)
    line.force_encoding(Encoding::UTF_8)
    pair = Dcf.parse(line)
    return if pair.nil?
    attribute = pair.first.keys[0]
    if attribute == 'Package'
      @package = pair.first.values[0]
    elsif attribute == 'Version'
      @version = pair.first.values[0]
      yield package(@package, @version)
    end
  end

  def file
    URI.join(url, 'PACKAGES')
  end
end
