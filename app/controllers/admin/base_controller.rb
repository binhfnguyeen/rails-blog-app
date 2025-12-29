module Admin
  class BaseController < ApplicationController
    layout 'admin'

    before_action :authenticate_user!
    before_action :require_admin!

    private

    def require_admin!
      unless current_user.admin?
        # Bước 1: Đăng xuất user thường để tránh bị kẹt session
        sign_out current_user

        # Bước 2: Thông báo lỗi
        flash[:alert] = "Tài khoản này không có quyền quản trị. Vui lòng đăng nhập bằng tài khoản Admin."

        # Bước 3: Chuyển hướng về trang đăng nhập thay vì root_path
        redirect_to new_user_session_path
      end
    end
  end
end