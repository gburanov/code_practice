# frozen_string_literal: true

class SearchController < ActionController::Base
  def search
    @bookmarks = Searcher.new(params[:search_criteria]).call
    render 'bookmarks/index'
  end
end
