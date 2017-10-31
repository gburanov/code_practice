class Bookmark < ApplicationRecord
  validates :text, presence: true
  validates :url, presence: true
end
