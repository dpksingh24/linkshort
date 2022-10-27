class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def create
    @user = User.new(set_user_params)
    if @user.save!
      render json: @user, status: :created
    else
      render json: "error"
  end

  def show
    @user = User.find_by(id: params[:id])
    render json: @user
  end

  private
  def set_user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
