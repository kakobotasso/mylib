class BooksController < ApplicationController
  before_filter :require_logged_user
  
  def index
    @title = I18n.t('books.index.title')
    @books = Book.where(user_id: @current_user).order(name: :desc)
  end

  def new
    @title = I18n.t('books.new.title')
    @book = Book.new
    @authors = Author.where(user_id: @current_user).order(:name)
    gon.nota = 0
    if @authors.empty?
      redirect_to authors_path, alert: t('books.new.aviso') 
    end
  end

  def create
    @book = Book.new(book_params)
    @authors = Author.where(user_id: @current_user).order(:name)

    if @book.save
      redirect_to books_path, success: t('books.create.salvo_sucesso')
    else
      render :new
    end
  end

  def edit
    @title = I18n.t('books.edit.title')
    @book = Book.find(params[:id])
    @authors = Author.where(user_id: @current_user).order(:name)
    gon.nota = @book.grade || 0
  end

  def update
    @book = Book.find(params[:id])
    @authors = Author.where(user_id: @current_user).order(:name)

    if @book.update_attributes(book_params)
      redirect_to books_path, success: t('books.update.atualizado_sucesso')
    else
      render :edit
    end 
  end

  def bought
    @book = Book.find(params[:id])
    @book.wishlist = false

    if @book.save
      redirect_to dashboard_path, success: t('books.atualizado_sucesso')
    else
      redirect_to dashboard_path, failure: t('books.atualizado_falha')
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
 
    redirect_to books_path, success: t('books.destroy.deletado_sucesso')
  end

  private
  def book_params
    params.require(:book).permit(:name, :author_id, :grade, :wishlist, :link, :read).merge!({user_id: session[:user_id], slug: params[:book][:name].parameterize})
  end
end
