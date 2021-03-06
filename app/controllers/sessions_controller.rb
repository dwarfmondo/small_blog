class SessionsController < ApplicationController
  def new
    sign_out if signed_in?
  end

  def create
    user = User.find_by(email: session_params[:email].downcase)

    if user && user.authenticate(session_params[:password])
      sign_in user
      redirect_to blogs_path
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
