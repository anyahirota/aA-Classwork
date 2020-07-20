class ApplicationController < ActionController::Base
    helper_method :signed_in?, :current_user
    #skip_before_action :verify_authenticity_token

    def current_user
        @current_user ||= User.find_by(session_token: session[:token])
    end 
    
    def sign_in(user)
        @current_user = user
        session[:token] = user.reset_session_token!
    end 

    def signed_in?
        current_user != nil
    end 

    def sign_out
        @current_user.reset_session_token!
        session[:token] = nil
        @current_user.session_token = nil 
    end 

    def require_sign_in
        redirect_to new_session_url unless signed_in?
    end 

    def require_sign_out
        redirect_to subs_url if signed_in?
    end 
end
