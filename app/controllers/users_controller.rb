class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def create
    @book = Book.new(book_params)
    @book.user.id = current_user
    @book.save
    redirect_to book_path(@book.id)
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
