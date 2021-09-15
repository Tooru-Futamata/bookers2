class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def create
    @user = User.new(user_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @users = User.all
    @book = Book.new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
     flash[:notice] = "You have updated user successfully."
     redirect_to user_path(@user)
    else
      @users = User.all
      render :edit
    end
  end

  private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end