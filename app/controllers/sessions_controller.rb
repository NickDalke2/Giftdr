class SessionsController < ApplicationController
  def create
    @user = User.from_omniauth(request.env['omniauth.auth'])
    session[:user_id] = @user.id
    flash[:success] = "Welcome, #{@user.name}!"
    @user.save
    if @user.email
      UserMailer.welcome(@user).deliver 
    end
    redirect_to reminders_path
  end
  def destroy
    if current_user
      session.delete(:user_id)
    end
    flash[:notice] = "See you!"
    redirect_to root_path
  end

private

end
