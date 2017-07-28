class Customer < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :street, :city, :postcode, :birthday, :email

  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email

  validates :first_name, length: { in: 3..20 }

  validates :first_name, format: { with: /\A[A-Z]+\z/ }

  has_many :notes

  def to_s
    "#{last_name}, #{first_name}"
  end
end
