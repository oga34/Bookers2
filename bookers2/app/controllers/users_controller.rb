class UsersController < ApplicationController
  before_action :correct_user, only:[:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.where(user_id: @user.id).includes(:user).order("created_at DESC")
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    else
     render :edit
    end
  end
  
  def edit
    @user = current_user
  end

  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(user_path(current_user)) unless @user == current_user
  end

end
