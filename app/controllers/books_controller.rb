class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
    @authors = Author.order(:name)
  end

  def create
    @book = Book.new(book_params)
    @authors = Author.order(:name)

    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
    @authors = Author.order(:name)
  end

  def update
    @book = Book.find(params[:id])
    @authors = Author.order(:name)

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
    params.require(:book).permit(:name, :author_id, :grade, :wishlist, :link, :read)
  end
end
