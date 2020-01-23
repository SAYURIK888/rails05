class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true
  
  belongs_to :user
  has_many :comments

  mount_uploader :image, ImageUploader
  # has_secure_password
  # has_many :topics
  
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'
end
