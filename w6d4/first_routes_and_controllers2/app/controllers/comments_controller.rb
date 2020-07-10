class CommentsController < ApplicationController
    def index
        comments = Comment.all 
        if params[:user_id] 
            user = User.find(params[:user_id])
            render json: user.comments 
        elsif params[:artwork_id]
            artwork = Artwork.find(params[:artwork_id])
            render json: artwork.comments
        end 
    end

    def create
        comment = Comment.new(comment_params)
        if comment.save 
            render json: comment 
        else 
            render json: comment.errors.full_messages, status: 422
        end
    end 

    def destroy      
      comment = Comment.find(params[:id])
      comment.destroy
      render json: comment
    end

    private 
    def comment_params
      params.require(:comment).permit(:user_id, :artwork_id, :body)
    end 
end
