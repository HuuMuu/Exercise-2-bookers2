class UsersController < ApplicationController
  #before_action :correct_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @books = Book.all
  end

  def new
    @user = User.new(user_params)
  end

  def create
    @user = user.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Welcome! You have signed up successfully"
    else
      render :new
    end
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(book.id)
    else
      render :index
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def index
    @user = User.find(current_user.id)
    @users = User.all
  end

  private

  #def correct_user
    #@user = user.find(params[:id])
    #redirect_to(user_path) unless @user == current_user
  #end

  def user_params
    params.require(:user).permit(:name, :introduction)
  end

  #def correct_user
    #@book = Book.find(params[:id])
    #@user = @book.user
    #redirect_to(books_path) unless @user == current_user
  #end
end
