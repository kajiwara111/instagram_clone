class User < ApplicationRecord
  before_validation {email.downcase!}
  validates :name, presence: true, length: {maximum: 30}
  validates :email, presence: true, length: {maximum: 255}, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true #password登録時はhas_secure_passowrdのバリデーションが走るので問題なし
  has_secure_password
  has_many :feeds
  has_many :favorites, dependent: :destroy
  has_many :favorite_feeds, through: :favorites, source: :feed
  mount_uploader :image, ImageUploader
end
