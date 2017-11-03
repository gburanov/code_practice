# frozen_string_literal: true

class Searcher
  attr_reader :search_field

  def initialize(search_field)
    @search_field = search_field
  end

  def call
    search_in_site + search_in_topic
  end

  private

  def search_in_topic
    Bookmark.where(topic: search_field)
  end

  def search_in_site
    Site.where(host: search_field).bookmarks
  end
end
