class UsersController < ApplicationController
    def new 
        render :new 
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            redirect_to users_url
        else 
            flash.now[:errors] = @user.errors.full_messages 
            render :new
        end
    end 

    def show
        @user = User.find_by(id: params[:id])
        if logged_in?
            render :show
        else 
            redirect_to new_session_url
        end 
    end 

    def index 
        @users = User.all
        if logged_in?
            render :index 
        else 
            redirect_to new_session_url
        end 
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end 
end
