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
    @bookmark = Bookmark.new
  end

  def update
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.update(bookmark_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def show
  end

  private

  def bookmark_params
    params.permit(:url, :title, :shortening)
  end
end
