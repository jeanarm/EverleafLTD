module SessionsHelper
    def current_user
        @current_user ||= Usr.find_by(id: session[:usr_id])
      end
    def logged_in?
        current_user.present?
    end

end
