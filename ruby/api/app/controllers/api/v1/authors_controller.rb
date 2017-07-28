module Api
  module V1
    class AuthorsController < ApplicationController
      before_action :set_author, only: [:show, :update, :destroy]

      def index
        @authors = Author.all
      end

      def show
      end

      def new
        @author = Author.new
      end

      def create
        @author = Author.new(author_params)
        @author.creator = current_user
        render_json_with_errors_for(@author) unless @author.save
      end

      def update
        render_json_with_errors_for(@author) unless @author.update(author_params)
      end

      def destroy
        @author.destroy
      end

      private

      def author_params
        params.require(:author).permit(:name, :biography)
      end

      def set_author
        @author = Author.find(params[:id])
      end
    end
  end
end
