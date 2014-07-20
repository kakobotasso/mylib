class BooksController < ApplicationController
  before_filter :require_logged_user
  
  def index
    @title = I18n.t('books.index.title')
    @books = Book.where(user_id: @current_user)
  end

  def new
    @title = I18n.t('books.new.title')
    @book = Book.new
    @authors = Author.where(user_id: @current_user).order(:name)
  end

  def create
    @book = Book.new(book_params)
    @authors = Author.where(user_id: @current_user).order(:name)

    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def edit
    @title = I18n.t('books.edit.title')
    @book = Book.find(params[:id])
    @authors = Author.where(user_id: @current_user).order(:name)
  end

  def update
    @book = Book.find(params[:id])
    @authors = Author.where(user_id: @current_user).order(:name)

    if @book.update_attributes(book_params)
      redirect_to books_path
    else
      render :edit
    end 
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
 
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:name, :author_id, :grade, :wishlist, :link, :read).merge!({user_id: session[:user_id]})
  end
end
