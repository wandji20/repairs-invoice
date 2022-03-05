class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  helper_method :current_user, :user_signed_in?
  private
  def login(id)
    session[:user_id] = id
  end

  def logout
    session.delete(:user_id)
  end


  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    current_user.present?
  end

  def authenticate_user!
    redirect_to new_session_path unless current_user.present?
  end
end
