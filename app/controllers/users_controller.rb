class UsersController < ApplicationController
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def create
    @book = Book.new(book_params)
    @book.create

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update
    redirect_to user_path(user.id)
  end

  def index
    @users = User.all
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end
