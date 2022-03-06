class UsersController < ApplicationController

  def show
    @new_book = Book.new
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def index
  end

end
