Rails.application.routes.draw do
  mount Blog::V1::Auth => '/api'
  mount Blog::V1::Posts => '/api'

  devise_for :users

  namespace :admin do
    # Đường dẫn gốc của admin: /admin -> DashboardController#index
    root "dashboard#index"

    # Hỗ trợ thêm đường dẫn /admin/dashboard nếu bạn muốn tường minh
    get 'dashboard', to: 'dashboard#index'

    resources :posts
  end

  root "admin/dashboard#index"
end
