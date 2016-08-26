class UsersController < ApplicationController
  before_action :require_user, only: [:edit, :update, :delete, :destroy]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in @user
      redirect_to @user
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def delete

  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
