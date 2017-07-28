require 'yaml'
require_relative '../string'
require_relative 'connection'
require 'securerandom'

class Property < ActiveRecord::Base
  self.primary_key = 'name'

  before_create do
    if self.name.nil?
      self.name = SecureRandom.hex(5).upcase!
    end
  end

  validates_length_of :title, :minimum => 1
  validates_inclusion_of :property_type, :in => [
      "holiday home",
      "apartment",
      "private room",
  ]
  validates_length_of :address, :minimum => 1
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_length_of :phone_number, :minimum => 1
  validates :nightly_rate, :numericality => { :greater_than_or_equal_to => 1 }
  validates :guests, :numericality => { :greater_than_or_equal_to => 1 }

  POSSIBLE_PARAMETERS = {
      :title => "Title:",
      :property_type => "Property type:",
      :address => "Address:",
      :email => "Email:",
      :phone_number => "Phone number:",
      :nightly_rate => "Nightly rate in EUR:",
      :guests => "Max guests:",
  }

  def [](key)
    self.attributes[key.to_s]
  end

  def []=(key, value)
    value.strip!
    key = key.to_s
    self.assign_attributes(key => value)

    self.save!(validate: false)
    self.validations(key, value)
  end


  def validations key, value, allow_empty = false
    if value.to_s == '' and allow_empty == true
      return
    end
    if not self.valid_attribute?(key)
      raise "Invalid value #{value} for #{key}. #{self.errors.values.first.first }"
    end
  end

  def self.list
    ret = Property.all.select { |p| p.valid? }
    ret
  end

  def to_s
    Property::POSSIBLE_PARAMETERS.each do |key, value|
      puts "#{value} #{self[key]}" if not self[key].nil?
    end
    puts "NOT COMPLETE!" if not valid?
  end

  def valid_attribute?(attribute)
    self.errors.clear

    validators = self.class.validators_on(attribute)
    validators.each { |validator| validator.validate(self) }

    self.errors.empty?
  end

  def save!(args = {})
    args.merge!({validate: false})
    super(args)
  end

end