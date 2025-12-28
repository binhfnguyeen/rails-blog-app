module Blog
  module Api
    module Post
      class BaseEntity < Grape::Entity
        expose :id
        expose :title
        expose :content
        expose :status
        expose :created_at

        expose :user, using: Blog::Api::User::BaseEntity
      end
    end
  end
end