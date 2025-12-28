class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Một User thì sẽ có nhiều bài viết
  # depentdent: :destroy - xóa 1 User thì sẽ xóa luôn bài Post của User đó
  has_many :posts, dependent: :destroy

  enum :role, { user: 'user', admin: 'admin' }, default: 'user'
end
