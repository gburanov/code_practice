require "attr_extras"
require "open-uri"
require "dcf"

require "byebug"

require "./package_factory.rb"

class Repository
  rattr_initialize :url

  # probably need to switch it to state machine
  def parse
    open(file) do |f|
      @package = ""
      @version = ""
      f.read.each_line do |line|
        pair = Dcf.parse(line)
        next if pair.nil?
        attribute = pair.first.keys[0]
        if attribute == "Package"
          @package = pair.first.values[0]
        elsif attribute == "Version"
          @version = pair.first.values[0]
          yield package(@package, @version)
        end
      end
    end
  end

  def package(name, version)
    PackageFactory.new(name, version, url).extract
  end

  private

  def file
    URI::join(url, "PACKAGES")
  end
end
