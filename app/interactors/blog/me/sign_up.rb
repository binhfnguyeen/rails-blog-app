module Blog
  module Me
    class SignUp < Common::Interactor
      def call
        user = User.new(
          email: context.email,
          password: context.password,
          password_confirmation: context.password_confirmation,
          role: :user
        )

        if user.save
          context.user = user
        else
          context.fail!(error: user.errors.full_messages.join(", "))
        end
      end
    end
  end
end