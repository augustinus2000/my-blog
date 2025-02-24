class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post
  
    def create
      @post = Post.find(params[:post_id])
      
      @comment = if params[:comment][:parent_id].present?
                   parent_comment = Comment.find(params[:comment][:parent_id])
                   parent_comment.replies.build(comment_params)
                 else
                   @post.comments.build(comment_params)
                 end
    
      @comment.user = current_user
    
      if @comment.save
        redirect_to @post, notice: "Comment added successfully."
      else
        redirect_to @post, alert: "Failed to add comment."
      end
    end
    
  
    def destroy
      # @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      @comment.destroy
      redirect_to post_path(@post)
    end
  
    private
  
    def set_post
      @post = Post.find(params[:post_id])
    end
  
    def comment_params
      params.require(:comment).permit(:body)
    end
  end