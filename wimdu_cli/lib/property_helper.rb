require 'securerandom'

# It will help us to create new properties
class PropertyHelper

  def initialize(name = nil)
    if name.nil?
      @property = Property.create(:name => SecureRandom.hex(5).upcase!)
      puts "Starting with new property #{@property.name}."
    else
      @property = Property.find_by_name(name)
      raise "Property not found" if @property.nil?
      puts "Continuing with #{@property.name}."
    end
    @property.save!
  end

  def parse
    parse_input
    if @property.valid?
      puts "Great job! Listing #{@property.name} is complete!"
    end
  end

  private

  def parse_input
    # let user enter only properties that do not exist
    Property::POSSIBLE_PARAMETERS.each do |key, value|
      if @property[key].nil?
        begin
          print value + " "
          STDOUT.flush
          val = $stdin.readline()
          @property[key] = val
        rescue RuntimeError => e
          puts e.to_s
          retry
        end
        @property.save!
      end
    end
  end

end