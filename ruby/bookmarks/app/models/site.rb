# frozen_string_literal: true

class Site < ApplicationRecord
  has_many :bookmarks

  def self.for(uri)
    return nil if uri.host.blank?
    Site.find_or_create_by(host: uri.host)
  end
end
