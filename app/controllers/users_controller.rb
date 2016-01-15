class UsersController < ApplicationController
  before_action :find_user, only:[:show,:edit,:destroy,:update]
  before_action :logged_in?, only:[:show,:edit,:update,:destroy]
  def index
    @users = User.all
  end

  def show
  end

  def new
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to reminders_path
    else
      render :edit
    end
  end

private
  def user_params
    params.require(:user).permit(:name,:email,:phone)
  end

  def find_user
    @user = User.find(params[:id])
  end
end