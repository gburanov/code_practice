# frozen_string_literal: true

class Site < ApplicationRecord
  def self.for(uri)
    return nil if uri.host.blank?
    Site.find_or_create_by_host(uri.host)
  end
end
