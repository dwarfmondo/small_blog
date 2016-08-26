class UsersController < ApplicationController
  before_action :require_user, only: [:edit, :update, :delete, :destroy]

  def show
    load_user
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
    load_user

    authorize! :update, @user
  end

  def update
    load_user

    authorize! :update, @user
  end

  def delete
    load_user

    authorize! :destroy, @user
  end

  def destroy
    load_user

    authorize! :destroy, @user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def load_user
    @user ||= User.find(params[:id])
  end
end
