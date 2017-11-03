# frozen_string_literal: true

class Searcher
  attr_reader :search_field

  def initialize(search_field)
    @search_field = search_field
  end

  def call
    search_in_site + search_in_title + search_in_shortening + search_in_url
  end

  private

  def search_in_url
    Bookmark.where(url: search_field)
  end

  def search_in_shortening
    Bookmark.where(shortening: search_field)
  end

  def search_in_title
    Bookmark.where(title: search_field)
  end

  def search_in_site
    Site.where(host: search_field).map(&:bookmarks).flatten
  end
end
