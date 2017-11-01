# frozen_string_literal: true

class Bookmark < ApplicationRecord
  validates :title, presence: true
  validates :url, presence: true
end
