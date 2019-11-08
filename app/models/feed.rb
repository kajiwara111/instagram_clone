class Feed < ApplicationRecord
  validates :image, presence: true
  validates :content, length: {in: 1..255}
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  mount_uploader :image, ImageUploader
end