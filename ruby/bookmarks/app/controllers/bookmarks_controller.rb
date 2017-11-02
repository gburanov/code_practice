# frozen_string_literal: true

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

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.update(bookmark_params)
      redirect_to @bookmark
    else
      render 'edit'
    end
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url, :title, :shortening)
  end
end
