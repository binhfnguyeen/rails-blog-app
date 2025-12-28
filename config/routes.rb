Rails.application.routes.draw do
  mount Blog::V1::Auth => '/api'
  mount Blog::V1::Posts => '/api'
end
