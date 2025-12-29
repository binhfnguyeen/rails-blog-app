module Admin
  class DashboardController < BaseController
    def index
      @total_users = User.count
      @total_posts = Post.count
    end
  end
end