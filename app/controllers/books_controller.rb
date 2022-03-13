class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def index
    @new_book = Book.new
    @user = current_user
    @books = Book.all
  end

  def show
    @user = current_user
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to user_path(book.user.id)
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
