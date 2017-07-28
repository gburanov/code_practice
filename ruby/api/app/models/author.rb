class Author < ApplicationRecord
  has_many :books
  belongs_to :creator, foreign_key: "creator_id", class_name: "User"

  validates :name, presence: true
end
