class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/"
    else
      flash[:notice] = @user.errors.full_messages.to_sentence
      redirect_to '/register'
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user
      new_user = user_from_params(params)
      User.update(new_user)
      render json: {result: 'update successful', user: new_user}
    else
      render json: {result: "Exception, no find user with id: #{params[:id]}", user: @user}
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
  end


  private
  def user_params
    params.require(:user).permit(:login, :password, :name, :surname)
  end

end
