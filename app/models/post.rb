class Post < ApplicationRecord
  belongs_to :user

  enum :status, { draft: 0, published: 1}, default: :draft

  # Mặc định chỉ lấy bài chưa bị xóa (deleted_at = null)
  default_scope { where(deleted_at: nil)}

  # Xóa mềm cập nhật thời gian xóa
  def soft_delete
    update(deleted_at: Time.now)
  end

  def restore
    update(deleted_at: nil)
  end
end
