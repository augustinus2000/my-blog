class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post
  
    def create
      @comment = @post.comments.build(comment_params) # ✅ 게시물에 댓글 생성
      @comment.user = current_user
    
      if @comment.save
        redirect_to @post, notice: "Comment added successfully."
      else
        redirect_to @post, alert: "Failed to add comment."
      end
    end
    
    
  
    def destroy
      @comment = @post.comments.find(params[:id])
    
      if @comment.user == current_user
        @comment.destroy
        redirect_to post_path(@post), notice: "Comment deleted successfully."
      else
        redirect_to post_path(@post), alert: "You are not authorized to delete this comment."
      end
    end
  
    private
  
    def set_post
      @post = Post.find(params[:post_id])
    end
  
    def comment_params
      params.require(:comment).permit(:body)
    end
  end