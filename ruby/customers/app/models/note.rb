class Note < ActiveRecord::Base
  belongs_to :customer
  attr_accessible :body
end