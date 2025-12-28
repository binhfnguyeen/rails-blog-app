module Blog
  module Api
    module User
      class BaseEntity < Grape::Entity
        expose :id
        expose :email
        expose :role
      end
    end
  end
end