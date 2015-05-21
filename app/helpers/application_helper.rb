module ApplicationHelper
   def flash_class(level)
    case level
    when :notice then "alert-info"
    when :error then "alert-error"
    when :alert then "alert-warning"
    when :success then "alert-success"
    end
  end

  private
  def current_user
    @current_user ||= User.where(id: session[:user_id], confirmed: true).first
  end
  #helper_method :current_user
end
