require "./connection.rb"
require "./author.rb"

class Package < ActiveRecord::Base
  has_many :authors
  has_many :mantainers

  validates_presence_of :name
  validates_presence_of :version
  validates_presence_of :date
  validates_presence_of :title
  validates_presence_of :description

  def save
    package = Package.find_by(name: name, version: version)
    return super if package.nil?
    false
  end

  def to_s
    "Package #{name} with version #{version}"
  end
end
