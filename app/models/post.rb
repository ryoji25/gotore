class Post < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  validates :title, length: {maximum: 40}
  validates :text,length: {maximum: 1000}
  validates :date, length: {maximum: 40}
  validates :place, length: {maximum: 40}
  
end
