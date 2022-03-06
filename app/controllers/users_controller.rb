class UsersController < ApplicationController

  def show
    @new_book = Book.new
    @user = User.find(params[:id])
    @books = Book.all
  end

  def edit
  end

  def update
  end

  def index
  end

end
