class BooksController < ApplicationController
  before_action :load_book, except: %i(index new create)

  def index
    @books = Book.sort_by_alphabet.paginate(page: params[:page])
  end

  def show; end

  def new
    @book = Book.new
    @authors = Author.all
  end

  def create
    @book = Book.new book_params
    if @book.save
      flash[:success] = t ".book_add_success"
      redirect_to @book
    else
      render :new
    end
  end

  def update
    if @book.update_attributes book_params
      flash[:success] = t "form.update_succ"
      redirect_to @book
    else
      render :edit
    end
  end

  def edit; end

  def destroy
    if @book.destroy
      flash[:success] = t "pub.delete_succ"
    else
      flash[:danger] = t "pub.error"
    end
    redirect_to books_url
  end

  private

  def book_params
    params.require(:book).permit(:name, :author_id, :description, :picture)
  end

  def load_book
    @book = Book.find_by id: params[:id]
    return if @book
    flash[:danger] = t ".book_not_found"
    redirect_to root_path
  end
end
