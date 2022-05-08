class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # Look up the user the database
    @user = User.find_by(login: user_params[:login])
    if @user && @user.is_password?(user_params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      @user = User.new
      flash[:notice] = "Invalid email or password"
      redirect_to '/sign_in'
    end
    # Compare their password
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  private
  def user_params
    params.require(:user).permit(:login, :password)
  end
end
