class AuthorsController < ApplicationController
  before_action :load_author, except: %i(index new create)

  def index
    @authors = Author.order_name.search_by_name(params[:search]).paginate page: params[:page]
  end

  def new
    @author = Author.new
  end

  def show; end

  def create
    @author = Author.new author_params
    if @author.save
      flash[:success] = t "pub.create_succ"
      redirect_to authors_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @author.update_attributes author_params
      flash[:success] = t "pub.update_succ"
      redirect_to authors_url
    else
      render :edit
    end
  end

  def destroy
    if @author.destroy
      flash[:success] = t "pub.delete_succ"
    else
      flash[:danger] = t "pub.error"
    end
    redirect_to authors_url
  end

  private

  def author_params
    params.require(:author).permit :name, :birthday, :details
  end

  def load_author
    @author = Author.find_by id: params[:id]
    return if @author
    flash[:danger] = t "form.not_found"
    redirect_to author_url
  end
end
