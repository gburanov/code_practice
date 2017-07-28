class Book < ApplicationRecord
  belongs_to :author
  belongs_to :creator, foreign_key: "creator_id", class_name: "User"

  validates :name, presence: true
end
