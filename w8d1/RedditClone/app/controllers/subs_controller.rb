class SubsController < ApplicationController
    before_action :require_sign_in
    before_action :current_user_is_moderator, only: [:edit, :update]

    def new
        @sub = Sub.new
    end 

    def create
        @sub = Sub.new(sub_params)
        @sub.moderator_id = current_user.id 
        if @sub.save!
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end 
    end 

    def index 
        @subs = Sub.all
        render :index 
    end 

    def show
        @sub = Sub.find(params[:id])
        render :show
    end 

    def edit
       
    end 

    def update
         if @sub.update_attributes(sub_params)
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :edit 
        end 
    end 

    def current_user_is_moderator
        @sub = Sub.find(params[:id])
        if current_user.id != @sub.moderator_id
            flash.now[:error] = ["You must be the moderator to edit a sub."]
            render :index 
        end 
    end 

    private

    def sub_params
        params.require(:sub).permit(:title, :description)
    end 
end
