module Api
  module V1
    class BooksController < ApplicationController
      before_action :set_author, only: [:index]
      before_action :set_book, only: [:show, :update, :destroy]

      def index
        @books = @author.books
      end

      def show
      end

      def new
        @book = Book.new
      end

      def create
        @book = Book.new(book_params)
        @book.author = Author.find_by_id(params[:author_id])
        @book.creator = current_user
        render_json_with_errors_for(@book) unless @book.save
      end

      def update
        render_json_with_errors_for(@book) unless @book.update(book_params)
      end

      def destroy
        @book.destroy
      end

      private

      def book_params
        params.require(:book).permit(:name, :about)
      end

      def set_book
        @book = Book.find(params[:id])
      end

      def set_author
        @author = Author.find(params[:author_id])
      end
    end
  end
end
