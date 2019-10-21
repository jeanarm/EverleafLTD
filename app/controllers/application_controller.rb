class ApplicationController < ActionController::Base
    include SessionsHelper 
    private
    def current_user
     @current_user ||= Usr.find(session[:usr_id]) if session[:usr_id]
    end
      helper_method :current_user
    def authorize
      redirect_to log_in_url, alert: "Not authorized" if current_user.nil?
    end

end
