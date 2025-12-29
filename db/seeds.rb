puts "Đang khởi tạo dữ liệu mẫu"

User.find_or_create_by!(email: 'admin@gmail.com') do |user|
  user.password = '123456'              # Mật khẩu cho admin
  user.password_confirmation = '123456' # Xác nhận mật khẩu
  user.role = :admin
end

puts "Đã tạo xong tài khoản Admin: admin@gmail.com / 123456"