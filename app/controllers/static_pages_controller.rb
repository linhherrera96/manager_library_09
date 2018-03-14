class StaticPagesController < ApplicationController
  def home
    @books = Book.sort_by_alphabet.paginate(page: params[:page])
    @authors = Author.all
  end
end
