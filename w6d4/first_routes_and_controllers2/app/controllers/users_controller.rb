
class UsersController < ApplicationController

    def index
        # user = User.find(params[:user_id]) try to add search
        users = User.all   
        render json: users
    end 

    def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: 422
        end
    end

    def show
        user = User.find_by(id: params[:id])

        if !user.nil?
          render json: user
        else
          render json: 'user not found', status: 404
        end
    end

    def update
        user = User.find_by(id: params[:id])
        if !user.nil?
            if user.update(user_params)
                render json: user
            else  
                render json: user.errors.full_messages, status: :unprocessable_entity
            end 
        else
          render json: 'user not found', status: 404
        end
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: user
    end

    private

  # Using a private method to encapsulate the permissible parameters
  # is just a good pattern since you'll be able to reuse the same
  # permit list between create and update. Also, you can specialize
  # this method with per-user checking of permissible attributes.
  def user_params
    params.require(:user).permit(:username)
  end


end

# Use dependent: :destroy in the artworks and artwork_shares associations on User