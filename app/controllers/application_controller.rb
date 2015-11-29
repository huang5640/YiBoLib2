class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :logged_in_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to 'login' unless current_user
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "请先登入!"
      redirect_to login_url
    end
  end
end
