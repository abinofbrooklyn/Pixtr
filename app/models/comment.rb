class Comment <ActiveRecord::Base
  belongs_to :user
  belongs_to :image

  default_scope -> {order(created_at: :asc)}
end
