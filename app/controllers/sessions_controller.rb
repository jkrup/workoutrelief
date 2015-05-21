class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    flash_message = current_user.nil? ? {alert: "Must Confirm Email"} : {success: "Signed In!"}
    redirect_to root_path, flash: flash_message
  end
  def confirm
    if session[:user_id]
      if params[:code] == User.find(session[:user_id]).confirmation_code.code
        User.find(session[:user_id]).update_attribute(:confirmed, true)
        redirect_to root_path, flash: {success: "You have been confirmed!"}
      else
        redirect_to root_path, flash: {alert: "Did not match code, try signing in again"}
      end
    else
      redirect_to root_path, flash: {alert: "Try signing in again"}
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_path, flash: {alert: "Signed Out!"}
  end

end
