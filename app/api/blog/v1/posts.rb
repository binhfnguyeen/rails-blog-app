module Blog
  module V1
    class Posts < Grape::API
      format :json
      content_type :json, 'application/json'

      helpers Blog::Helpers::AuthHelper

      resources :post do
        desc "Lấy danh sách bài viết (Chỉ hiện bài published)"
        get do
          posts = ::Post.where(status: :published).order(created_at: :desc)
          present posts, with: Blog::Api::Post::BaseEntity
        end

        desc "Xem chi tiết một bài viết"
        get ':id' do
          post = ::Post.find(params[:id])
          present post, with: Blog::Api::Post::BaseEntity
        end

        desc "Tạo bài viết mới"
        params do
          requires :title, type: String
          requires :content, type: String
          optional :status, type: String, values: ['draft', 'published'], default: 'draft'
        end

        post do
          authenticate!

          post = current_user.posts.create!(
            title: params[:title],
            content: params[:content],
            status: params[:status]
          )

          present post, with: Blog::Api::Post::BaseEntity
        end

        desc "Cập nhật bài viết"
        params do
          requires :id, type: Integer
          optional :title, type: String
          optional :content, type: String
          optional :status, type: String, values: ['draft', 'published']
        end

        put ':id' do
          authenticate!

          post = ::Post.find(params[:id])
          unless post.user_id == current_user.id || current_user.role == 'admin'
            error!({ error: 'Forbidden', message: 'Bạn không có quyền sửa bài viết này' }, 403)
          end

          post.update!(declared(params, include_missing: false))
          present post, with: Blog::Api::Post::BaseEntity
        end

        desc "Xóa bài viết"
        delete ':id' do
          authenticate!

          post = ::Post.find(params[:id])

          unless post.user_id == current_user.id || current_user.role == 'admin'
            error!({ error: 'Forbidden', message: 'Bạn không có quyền xóa bài viết này' }, 403)
          end

          post.destroy
          { message: "Đã xóa bài viết thành công" }
        end
      end
    end
  end
end