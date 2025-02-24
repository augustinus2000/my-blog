class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[show index]
  before_action :authorize_user!, only: %i[edit update destroy] # checking authorization

  def index
    @categories = Post::CATEGORIES
    @posts = Post.includes(:user).order(created_at: :desc)
  
    # 検索機能(검색 기능)
    if params[:search].present?
      search_query = "%#{params[:search]}%"
      Rails.logger.info "🔎 검색어: #{search_query}"
      @posts = @posts.joins(:user).where("posts.title LIKE ? OR users.name LIKE ?", search_query, search_query)
    end
  
    # ✅ 카테고리 필터링 적용
    if params[:category_id].present? && @categories.include?(params[:category_id])
      @posts = @posts.where(category: params[:category_id])
    end
  
    # ✅ 최종적으로 정렬 및 페이지네이션 적용
    @posts = @posts.order(created_at: :desc).page(params[:page]).per(6)
  end
  

  def show
    @post.update(views: @post.views + 1)
    @comments = @post.comments.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params) # ✅ `current_user`의 게시글로 생성

    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @post.user == current_user
      @post.destroy!
      redirect_to posts_path, status: :see_other, notice: "Post was successfully deleted."
    else
      redirect_to posts_path, alert: "You are not authorized to delete this post."
    end
  end

  private

  def authorize_user!
    redirect_to posts_path, alert: "You are not authorized to perform this action." unless @post.user == current_user
  end    

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :category, :image)
  end
end
