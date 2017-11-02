# frozen_string_literal: true

class Bookmark < ApplicationRecord
  belongs_to :site

  before_validation :assign_site

  validates :title, presence: true
  validates :url, presence: true

  private

  def assign_site
    self.site = Site.for(URI.parse(url))
  end
end
