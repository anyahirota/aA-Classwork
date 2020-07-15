class UsersController < ApplicationController
    def index
        @users = User.all
        render :index 
    end 
   
    def show
        render :show
    end

    def create
        #debugger
        @user = User.new(user_params)
        if @user.save!
            login!(@user)
            redirect_to user_url(@user)
        else 
            render :new
        end 
    end 

    def new
        @user = User.new
        render :new
    end 


    private

    def user_params
        params.require(:user).permit(:email, :password)
    end 
end
