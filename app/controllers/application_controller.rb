class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :current_user?, :signed_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_user?(user)
    current_user == user
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session.delete(:user_id)
    @current_user = nil
  end

  def signed_in?
    !current_user.nil?
  end

  def require_user
    if signed_in?
      true
    else
      flash[:info] = 'Sign in below to continue'
      if request.fullpath.empty? || request.fullpath == "/"
        redirect_to signin_path
      else
        redirect_to signin_path(:to => request.fullpath)
      end

      false
    end
  end
end
