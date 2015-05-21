class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    @current_user ||= User.where(id: session[:user_id], confirmed: true).first
  end

  helper_method :current_user
end
