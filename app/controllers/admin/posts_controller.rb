module Admin
  class PostsController < BaseController
    before_action :set_post, only: [:edit, :update, :destroy]

    def index
      @posts = Post.all.order(created_at: :desc)
    end

    def edit

    end

    def update
      if @post.update(post_params)
        redirect_to admin_posts_path, notice: 'Cập nhật bài viết thành công.'
      else
        render :edit
      end
    end

    def destroy
      @post.destroy
      redirect_to admin_posts_path, notice: 'Đã xóa bài viết thành công.'
    end

    private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :status)
    end
  end
end