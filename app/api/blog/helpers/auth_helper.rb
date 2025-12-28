require 'jwt'

module Blog
  module Helpers
    module AuthHelper
      def authenticate!
        error!('Unauthorized. Token không hợp lệ hoặc thiếu.', 401) unless current_user
      end

      def current_user
        return @current_user if @current_user

        token = request.headers['Authorization']&.split(' ')&.last
        return nil unless token

        begin
          secret_key = 'chuoi_bi_mat_tam_thoi_cho_dev'
          decoded = ::JWT.decode(token, secret_key, true, { algorithm: 'HS256' })

          payload = decoded.first
          user_id = payload['user_id']
          @current_user = User.find_by(id: user_id)
        rescue JWT::DecodeError
          nil
        end
      end

      def require_admin!
        authenticate!
        error!('Forbidden. Bạn không có quyền Admin.', 403) unless current_user.admin?
      end
    end
  end
end