# app/controllers/api/posts_controller.rb
module Api
  class PostsController < ApiController
    skip_before_action :authenticate_user!, only: [:index, :show]

    def index
      posts = Post.all

      posts = posts.where(category: params[:category]) if params[:category].present?
      posts = posts.where("title LIKE ? OR body LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?

      posts = posts.page(params[:page]).per(6)

      render json: {
        posts: posts.as_json(
          only: [:id, :title, :views, :created_at, :category],
          include: { user: { only: [:id, :name] } },
          methods: [:decoded_body] # ✅ 추가
        ),
        total_pages: posts.total_pages,
        current_page: posts.current_page
      }
    end
  end
end
