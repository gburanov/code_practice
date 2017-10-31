class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    if @bookmark.save
      redirect_to @bookmark
    else
      render 'new'
    end
  end

  def new

  end

  def update
  end

  def show
  end

  private

  def bookmark_params
    byebug
    params.require(:bookmark).permit(:url, :text, :shortening)
  end
end
