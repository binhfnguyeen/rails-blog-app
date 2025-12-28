require 'jwt'

module Blog
  module Me
    class SignIn < Common::Interactor
      def self.call(email:, password:)
        new(email: email, password: password).perform
      end

      def initialize(email:, password:)
        @email = email
        @password = password
      end

      def perform
        user = User.find_by(email: @email)

        if user&.valid_password?(@password)
          token = generate_token(user)
          OpenStruct.new(success?: true, user: user, token: token, error: nil)
        else
          OpenStruct.new(success?: false, user: nil, token: nil, error: 'Email hoặc mật khẩu không đúng')
        end
      end

      private

      def generate_token(user)
        payload = {
          user_id: user.id,
          exp: 24.hours.from_now.to_i
        }

        secret_key = 'chuoi_bi_mat_tam_thoi_cho_dev'
        ::JWT.encode(payload, secret_key, 'HS256')
      end
    end
  end
end