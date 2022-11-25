class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :username, presence: true
  validates :email, format: { with: /\S+@\S+/ },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true
end
