class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates_uniqueness_of :post_id, scope: :user_id
end
