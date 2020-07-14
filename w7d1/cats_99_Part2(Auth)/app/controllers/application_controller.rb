class ApplicationController < ActionController::Base
    
    helper_method :current_user

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token]) #session = {k => v, k => v, k => v, token => akjfdberigygbea, ,k => v}
    end  

end
