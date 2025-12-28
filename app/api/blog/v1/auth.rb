module Blog
  module V1
    class Auth < Grape::API
      format :json
      content_type :json, 'application/json'

      resource :auth do
        desc "Đăng ký tài khoản"
        params do
          requires :email, type: String
          requires :password, type: String
          requires :password_confirmation, type: String
        end

        post :register do
          result = Blog::Me::SignUp.call(
            email: params[:email],
            password: params[:password],
            password_confirmation: params[:password_confirmation]
          )

          if result.success?
            present result.user, with: Blog::Api::User::BaseEntity
          else
            error!({ error: result.error }, 422)
          end
        end

        desc "Đăng nhập"
        params do
          requires :email, type: String
          requires :password, type: String
        end
        post :login do
          result = Blog::Me::SignIn.call(
            email: params[:email],
            password: params[:password]
          )

          if result.success?
            response_data = {
              token: result.token,
              user: Blog::Api::User::BaseEntity.represent(result.user)
            }

            present response_data
          else
            error!({ error: result.error }, 401)
          end
        end
      end
    end
  end
end