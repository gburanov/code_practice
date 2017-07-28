require_relative "model/property"
require_relative "property_helper"

require 'thor'

class WimduCLI < Thor

  desc "list", "list"
  def list
    list = Property.list
    if list.empty?
      puts "No offers found."
      return
    end
    puts "Found #{list.length} offers"
    list.each do |property|
      puts "#{property.name}: #{property.title}"
    end
  end

  desc "show NAME", "show property"
  def show(name)
    begin
      property = Property.find_by_name(name)
      puts property.to_s
    rescue
      puts "Error obtaining #{name}"
    end
  end

  desc "cont NAME", "continue with property"
  def cont(name)
    helper = PropertyHelper.new(name)
    helper.parse
  end

  desc "new", "creates new property"
  def new
    helper = PropertyHelper.new
    helper.parse
  end
end