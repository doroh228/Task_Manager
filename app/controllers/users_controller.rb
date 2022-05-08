class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    user = user_from_params(params)
    if user.save
      render json: {result: 'create successful', user: user}, status: 201
    else
      render json: {result: "Exception", user: user}, status: 200
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

  def show
    @user = User.find_by(id: params[:id])
  end

  def user_from_params(params)
    User.new(
      login: params[:user][:login],
      password: params[:user][:password],
      name: params[:user][:name],
      surname: params[:user][:surname],
      role_id: params[:user][:role]
    )
  end

end
