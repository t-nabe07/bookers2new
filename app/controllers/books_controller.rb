class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = '投稿が完了しました'
      redirect_to book_path(@book.id)
    else
      @new_book = Book.new
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render :edit
    else
      @book = Book.new
      @new_book = Book.new
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = '編集が完了しました'
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def index
    @book = Book.new
    @new_book = Book.new
    @user = current_user
    @books = Book.all
  end

  def show
    @new_book = Book.new
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
